package org.b3log.symphony.processor;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.text.DecimalFormat;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.b3log.latke.Keys;
import org.b3log.latke.Latkes;
import org.b3log.latke.ioc.LatkeBeanManager;
import org.b3log.latke.ioc.Lifecycle;
import org.b3log.latke.model.User;
import org.b3log.latke.service.ServiceException;
import org.b3log.latke.util.CollectionUtils;
import org.b3log.symphony.model.Video;
import org.b3log.symphony.model.VideoSize;
import org.b3log.symphony.service.*;
import org.b3log.symphony.util.Symphonys;
import org.json.JSONObject;

/**
 * Servlet implementation class UploadVideo
 */
@WebServlet(urlPatterns = {"/uploadVideo"}, loadOnStartup = 2)
public class UploadVideoServlet extends HttpServlet {
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
	public UploadVideoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 2、创建一个文件上传解析器
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 解决上传文件名的中文乱码
		upload.setHeaderEncoding("UTF-8");
		// 3、判断提交上来的数据是否是上传表单的数据
		if (!ServletFileUpload.isMultipartContent(request)) {
			return;
		}
		// 4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
		List<FileItem> list = null;
		try {
			list = upload.parseRequest(request);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}

		HashMap<String, String> map = new HashMap<String, String>();

		final JSONObject data = new JSONObject();

		System.out.println("-------------------------------------------------------------");
		for (FileItem item : list) {
			if (item.isFormField()) {
				/**
				 * 表单数据
				 */
				String name = item.getFieldName();
				// 解决普通输入项的数据的中文乱码问题
				String value = item.getString("UTF-8");
				// value = new String(value.getBytes("iso8859-1"),"UTF-8");
				System.out.println(name + "=" + value);
				map.put(name, value);// 放入map集合
			} else {
				/**
				 * 文件上传
				 */
				//格式化小数，不足的补0
				DecimalFormat df = new DecimalFormat("0.00");
				//获取当前用户
				final JSONObject currentUser = (JSONObject) request.getAttribute(User.USER);
				final String currentUserId = currentUser.optString(Keys.OBJECT_ID);
				//check size
				// 获得文件大小
				Long size = item.getSize();
				if(1*1024*1024 > size){
					data.put("checkmsg","MinSize");
					final PrintWriter writer = response.getWriter();
					writer.append(data.toString());
					writer.flush();
					writer.close();
					break;
				}
				String filename = item.getName();
				if (filename == null || filename.trim().equals("")) {
					continue;
				}
				//check fommat
				String suffix = StringUtils.substringAfterLast(filename, ".");
				if(!"mp4".equals(suffix)||"war".equals(suffix)||"sql".equals(suffix)){
					data.put("checkmsg","format");
					final PrintWriter writer = response.getWriter();
					writer.append(data.toString());
					writer.flush();
					writer.close();
					break;
				}
				File fileParent = new File(Symphonys.get("nginx.upload.temp.dir") + map.get("guid"));//以guid创建临时文件夹
				System.out.println(fileParent.getPath());
				if (!fileParent.exists()) {
					fileParent.mkdir();
				}
				//查询个人用户的空间大小
				final JSONObject videoSize = new JSONObject();
				videoSize.put(VideoSize.USER_ID, currentUserId);
				final Map<String, Class<?>> videoSizeFields = new HashMap<>();
				videoSizeFields.put(VideoSize.USER_ID,String.class);
				videoSizeFields.put(VideoSize.USER_MAX_VIDEO_SIZE,Integer.class);
				JSONObject result = null;
				try {
					result = videoSizeQueryService.getVideoSize(videoSize,videoSizeFields);
				} catch (ServiceException e) {
					e.printStackTrace();
				}
				final List<JSONObject> lists = CollectionUtils.<JSONObject>jsonArrayToList(result.optJSONArray(VideoSize.VIDEO_SIZE));
				if(list.size() == 0){
					videoSize.put(VideoSize.USER_MAX_VIDEO_SIZE,500);
					try {
						videoSizeMgmtService.addVideoSize("",videoSize);
					} catch (ServiceException e) {
						e.printStackTrace();
					}
				}else{
					JSONObject currresult = null;
					try {
						currresult = videoSizeQueryService.getVideoSize(videoSize,videoSizeFields);
					} catch (ServiceException e) {
						e.printStackTrace();
					}
					final List<JSONObject> currrlist = CollectionUtils.<JSONObject>jsonArrayToList(currresult.optJSONArray(VideoSize.VIDEO_SIZE));
					final JSONObject currVideoSize = lists.get(0);
					//获取此用户的所有视频大小
					final JSONObject requestJSONObject = new JSONObject();
					requestJSONObject.put(Video.VIDEO_AUTHORID, currentUserId);
					final Map<String, Class<?>> videoFields = new HashMap<>();
					videoFields.put(Video.VIDEO_SIZE,Integer.class);
					JSONObject videoResult = null;
					try {
						videoResult = videoQueryService.getUserVideoSize(requestJSONObject,videoFields);
					} catch (ServiceException e) {
						e.printStackTrace();
					}
					final List<JSONObject> videos = CollectionUtils.jsonArrayToList(videoResult.optJSONArray(Video.VIDEOS));
					int allSize = 0;
					for (JSONObject v : videos) {
						allSize+=v.optInt(Video.VIDEO_SIZE);
					}
					String bigSize = df.format(allSize + (float)size/1048576);
					if(Double.parseDouble(bigSize) > currVideoSize.optDouble(VideoSize.USER_MAX_VIDEO_SIZE)){
						if(size>currVideoSize.optInt(VideoSize.USER_MAX_VIDEO_SIZE)){
							data.put("checkmsg",(currVideoSize.optInt(VideoSize.USER_MAX_VIDEO_SIZE)-allSize));
							final PrintWriter writer = response.getWriter();
							writer.append(data.toString());
							writer.flush();
							writer.close();
							break;
						}
					}
				}
				

				// 注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：
				// c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
				// 处理获取到的上传文件的文件名的路径部分，只保留文件名部分
				filename = filename.substring(filename.lastIndexOf("\\") + 1);
					//创建文件
					File file;
					if (map.get("chunks") != null) {
						file = new File(fileParent, map.get("chunk"));
					} else {
						file = new File(fileParent, "0");
					}
					//copy
					FileUtils.copyInputStreamToFile(item.getInputStream(), file);

			}
		}
	}
}
