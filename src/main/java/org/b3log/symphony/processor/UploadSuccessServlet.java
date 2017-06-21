package org.b3log.symphony.processor;

import org.b3log.symphony.util.Symphonys;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = {"/uploadsuccess"}, loadOnStartup = 2)
public class UploadSuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
		String fileName = request.getParameter("fileName");
		
		System.out.println("start...!guid="+guid+";chunks="+chunks+";fileName="+fileName);
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
		File newFile = new File(Symphonys.get("nginx.video.dir")+fileName);
		FileOutputStream outputStream = new FileOutputStream(newFile, true);//文件追加写入
		
		byte[] byt = new byte[10*1024*1024];
		int len;
		FileInputStream temp = null;//分片文件
		for(int i = 0 ; i<chunks ; i++){
			temp = new FileInputStream(new File(Symphonys.get("nginx.upload.temp.dir")+"/"+guid+"/"+i));
			while((len = temp.read(byt))!=-1){
				System.out.println(len);
				outputStream.write(byt, 0, len);
			}
		}
		/**
		 * 当所有追加写入都写完  才可以关闭流
		 */
		outputStream.close();
		temp.close();
		System.out.println("success!guid="+guid+";chunks="+chunks+";fileName="+fileName);
	}

}
