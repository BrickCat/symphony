package org.b3log.symphony.processor;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.b3log.latke.Keys;
import org.b3log.latke.ioc.LatkeBeanManager;
import org.b3log.latke.ioc.Lifecycle;
import org.b3log.latke.model.User;
import org.b3log.latke.service.ServiceException;
import org.b3log.latke.util.CollectionUtils;
import org.b3log.symphony.model.Trend;
import org.b3log.symphony.model.Video;
import org.b3log.symphony.model.VideoSize;
import org.b3log.symphony.service.*;
import org.b3log.symphony.util.Symphonys;
import org.b3log.symphony.util.TrendUtils;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Logger;

/**
 * Servlet implementation class UploadVideo
 */
@WebServlet(urlPatterns = {"/uploadTrend"}, loadOnStartup = 2)
public class UploadTrendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * beanManager
	 */
	final LatkeBeanManager beanManager = Lifecycle.getBeanManager();

	/**
	 * Video model service
	 */
	final TrendsMgmtService trendsMgmtService = beanManager.getReference(TrendsMgmtService.class);
	/**
	 * Video model service
	 */
	final TrendsQueryService trendsQueryService = beanManager.getReference(TrendsQueryService.class);
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadTrendServlet() {
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
	protected void doPost(final HttpServletRequest request, final HttpServletResponse response)
			throws ServletException, IOException {
		// 创建文件上传核心类
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(factory);
		// 解决上传文件名的中文乱码
		//设置编码
		sfu.setHeaderEncoding("UTF-8");
		// 3、判断提交上来的数据是否是上传表单的数据
		if (!ServletFileUpload.isMultipartContent(request)) {
			return;
		}
		final JSONObject data = new JSONObject();
		try {
			List<FileItem> list = sfu.parseRequest(request);

			HashMap<String, String> map = new HashMap<String, String>();
			int i = 0;
			System.out.println("-------------------------------------------------------------");
			for (FileItem item : list) {
				if (item.isFormField()) {
					/**
					 * 表单数据
					 */
					String name = item.getFieldName();
					// 解决普通输入项的数据的中文乱码问题
					String value = item.getString("UTF-8");
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
					String filename = item.getName();
					if (filename == null || filename.trim().equals("")) {
						continue;
					}
					//Id 由前台生成
					final String ret = map.get("uid");
					//创建Trend图片上传路径
					File fileParent = new File(Symphonys.get("nginx.trend.image.dir")+ret+"/");
					System.out.println(fileParent.getPath());
					if (!fileParent.exists()) {
						fileParent.mkdir();
					}
					//UUID
					final String uuid = UUID.randomUUID().toString().replaceAll("-", "");
					//后缀名
					String suffix = StringUtils.substringAfterLast(filename, ".");
					filename = uuid+"."+suffix;
					//创建文件
					File file= new File(fileParent,filename);
					//copy
					FileUtils.copyInputStreamToFile(item.getInputStream(), file);

					//String thumbname = TrendUtils.storeThumbnail(fileParent+"/"+filename,filename,Symphonys.get("nginx.trend.thumb.dir")+ret+"/");

					//根据ID判断数据库中是否有该条数据
					try {
						JSONObject trend = trendsQueryService.getTrend(ret);
						if(null == trend){
							trend = new JSONObject();
							trend.put(Trend.TREND_T_ID,ret);
							trend.put(Trend.TREND_AUTHOR_ID,currentUserId);
							trend.put(Trend.TREND_IMAGE_URL,ret+"/"+filename);
							trendsMgmtService.addTrend("",trend);
						}else{
							String imagePath = trend.optString(Trend.TREND_IMAGE_URL);
							imagePath =  imagePath + "," + ret + "/" + filename;
							trend.put(Trend.TREND_IMAGE_URL,imagePath);
							trendsMgmtService.updateTrend(ret,trend);
						}
					} catch (ServiceException e) {
						e.printStackTrace();
					}




				}
			}

		} catch (FileUploadException e) {
			e.printStackTrace();
		}
	}
}
