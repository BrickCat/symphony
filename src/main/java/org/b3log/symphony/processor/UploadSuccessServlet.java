package org.b3log.symphony.processor;

import org.b3log.latke.Keys;
import org.b3log.latke.ioc.LatkeBeanManager;
import org.b3log.latke.ioc.Lifecycle;
import org.b3log.latke.model.User;
import org.b3log.latke.service.ServiceException;
import org.b3log.latke.util.CollectionUtils;
import org.b3log.symphony.model.Video;
import org.b3log.symphony.model.VideoSize;
import org.b3log.symphony.service.*;
import org.b3log.symphony.util.Symphonys;
import org.b3log.symphony.util.VideoUtils;
import org.json.JSONObject;

import java.io.*;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = {"/uploadsuccess"}, loadOnStartup = 2)
public class UploadSuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * beanManager
	 */
	final LatkeBeanManager beanManager = Lifecycle.getBeanManager();

	/**
	 * data model service
	 */
	final DataModelService dataModelService = beanManager.getReference(DataModelService.class);

	/**
	 * video model service
	 */
	final VideoMgmtService videoMgmtService = beanManager.getReference(VideoMgmtService.class);

	/**
	 * videosize query service
	 */
	final VideoSizeQueryService videoSizeQueryService = beanManager.getReference(VideoSizeQueryService.class);

	/**
	 * videosize Mgmt service
	 */
	final VideoSizeMgmtService videoSizeMgmtService = beanManager.getReference(VideoSizeMgmtService.class);

	/**
	 * Video model service
	 */
	final VideoQueryService videoQueryService = beanManager.getReference(VideoQueryService.class);
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadSuccessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String guid = request.getParameter("guid");
		int chunks = Integer.parseInt(request.getParameter("chunks"));
		long size = Long.parseLong(request.getParameter("size"));
		String fileName = request.getParameter("fileName");
		final JSONObject data = new JSONObject();
		System.out.println("start...!guid="+guid+";chunks="+chunks+";fileName="+fileName);

		//UUID
		final String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		/**
		 * 进行文件合并
		 */
		File file = new File(Symphonys.get("nginx.upload.temp.dir")+"/"+guid);
		/**
		 * 判断分片数量是否正确
		 */
		if(file.list().length != chunks){
			return;
		}
		/**
		 * 进行文件合并
		 */
		String path = Symphonys.get("nginx.video.dir") +uuid;

		File saveDir = new File(path);
		// 如果目录不存在，就创建目录
		if(!saveDir.exists()){
			saveDir.mkdir();
		}

		File newFile = new File(path+"/"+fileName);
		FileOutputStream outputStream = new FileOutputStream(newFile, true);//文件追加写入
		
		byte[] byt = new byte[5*1024*1024];
		int len;
		FileInputStream temp = null;//分片文件
		for(int i = 0 ; i<chunks ; i++){
			temp = new FileInputStream(new File(Symphonys.get("nginx.upload.temp.dir")+"/"+guid+"/"+i));
			while((len = temp.read(byt))!=-1){
				outputStream.write(byt, 0, len);
			}
		}
		/**
		 * 当所有追加写入都写完  才可以关闭流
		 */

		JSONObject video = new JSONObject();

		//格式化小数，不足的补0
		DecimalFormat df = new DecimalFormat("0.00");
		//获取当前用户
		final JSONObject currentUser = (JSONObject) request.getAttribute(User.USER);
		final String currentUserId = currentUser.optString(Keys.OBJECT_ID);
		//imagePath
		String imagePath = Symphonys.get("nginx.video.image.dir")+uuid+".png";
		if(VideoUtils.getVideoImage(newFile.getPath(),imagePath)){
			video.put(Video.VIDEO_IMAGE_PATH,uuid+".png");
		}
		String m3u8Path = Symphonys.get("nginx.ffmpeg.dir")+uuid;
		File saveM3u8Dir = new File(m3u8Path);
		// 如果目录不存在，就创建目录
		if(!saveM3u8Dir.exists()){
			saveM3u8Dir.mkdir();
		}
		m3u8Path =  Symphonys.get("nginx.ffmpeg.dir")+uuid+"/"+uuid+".m3u8";
		if(VideoUtils.getVideoM3u8(newFile.getPath(),m3u8Path)){
			video.put(Video.VIDEO_URL,uuid+"/"+uuid+".m3u8");
		}
		//查询个人用户的空间大小
		final JSONObject videoSize = new JSONObject();
		videoSize.put(VideoSize.USER_ID, currentUserId);
		final Map<String, Class<?>> videoSizeFields = new HashMap<>();
		videoSizeFields.put(VideoSize.USER_ID,String.class);
		videoSizeFields.put(VideoSize.USER_MAX_VIDEO_SIZE,Integer.class);
		JSONObject currresult =null;
		try {
			currresult = videoSizeQueryService.getVideoSize(videoSize,videoSizeFields);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		final List<JSONObject> currrlist = CollectionUtils.<JSONObject>jsonArrayToList(currresult.optJSONArray(VideoSize.VIDEO_SIZE));
		final JSONObject currVideoSize = currrlist.get(0);
		int afterSize = Integer.parseInt(String.valueOf(currVideoSize.optInt(VideoSize.USER_MAX_VIDEO_SIZE) - Integer.parseInt(String.valueOf(size/1048576))));
		videoSize.put(VideoSize.USER_MAX_VIDEO_SIZE,afterSize);
		try {
			videoSizeMgmtService.addVideoSize(currVideoSize.optString(Keys.OBJECT_ID),videoSize);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		video.put(Video.VIDEO_STATUS,1);
		video.put(Video.VIDEO_TITLE,"");
		video.put(Video.VIDEO_POINT,0);
		video.put(Video.VIDEO_TAG,"");
		video.put(Video.VIDEO_TYPE,0);
		video.put(Video.VIDEO_AUTHORID,currentUserId);
		video.put(Video.VIDEO_REMARKS,"");
		video.put(Video.VIDEO_SIZE,size/1048576);
		String ret = "";
		try {
			ret = videoMgmtService.addVideo("",video,request);
		} catch (ServiceException e) {
			e.printStackTrace();
		}

		if(null != ret){
			delFolder(Symphonys.get("nginx.upload.temp.dir"));
		}
		data.put("ret",ret);
		response.setContentType("application/json");
		final PrintWriter writer = response.getWriter();
		writer.append(data.toString());
		writer.flush();
		writer.close();
		outputStream.close();
		temp.close();
	}

	//  // 删除完文件后删除文件夹
//  // param folderPath 文件夹完整绝对路径
	public static void delFolder(String folderPath) {
		try {
			delAllFile(folderPath); // 删除完里面所有内容
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 删除指定文件夹下所有文件
	// param path 文件夹完整绝对路径
	public static boolean delAllFile(String path) {
		boolean flag = false;
		File file = new File(path);
		if (!file.exists()) {
			return flag;
		}
		if (!file.isDirectory()) {
			return flag;
		}
		String[] tempList = file.list();
		File temp = null;
		for (int i = 0; i < tempList.length; i++) {
			if (path.endsWith(File.separator)) {
				temp = new File(path + tempList[i]);
			} else {
				temp = new File(path + File.separator + tempList[i]);
			}
			if (temp.isFile()) {
				temp.delete();
			}
			if (temp.isDirectory()) {
				delAllFile(path + "/" + tempList[i]);// 先删除文件夹里面的文件
				flag = true;
			}
		}
		return flag;
	}

}
