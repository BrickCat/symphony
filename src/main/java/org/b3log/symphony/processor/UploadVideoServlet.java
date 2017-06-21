package org.b3log.symphony.processor;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.b3log.latke.Latkes;
import org.b3log.symphony.util.Symphonys;
import org.json.JSONObject;

/**
 * Servlet implementation class UploadVideo
 */
@WebServlet(urlPatterns = {"/uploadVideo"}, loadOnStartup = 2)
public class UploadVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
//		if(true){
//			final JSONObject data = new JSONObject();
//			data.put("msg", "111");
//
//			response.setContentType("application/json");
//
//			final PrintWriter writer = response.getWriter();
//			writer.append(data.toString());
//			writer.flush();
//			writer.close();
//			return;
//		}


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
				
				File fileParent = new File(Symphonys.get("nginx.upload.temp.dir") + map.get("guid"));//以guid创建临时文件夹
				System.out.println(fileParent.getPath());
				if (!fileParent.exists()) {
					fileParent.mkdir();
				}
				
				
				String filename = item.getName();
				if (filename == null || filename.trim().equals("")) {
					continue;
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
