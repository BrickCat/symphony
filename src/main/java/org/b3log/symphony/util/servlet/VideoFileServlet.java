///*
// * Symphony - A modern community (forum/SNS/blog) platform written in Java.
// * Copyright (C) 2012-2017,  b3log.org & hacpai.com
// *
// * This program is free software: you can redistribute it and/or modify
// * it under the terms of the GNU General Public License as published by
// * the Free Software Foundation, either version 3 of the License, or
// * (at your option) any later version.
// *
// * This program is distributed in the hope that it will be useful,
// * but WITHOUT ANY WARRANTY; without even the implied warranty of
// * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// * GNU General Public License for more details.
// *
// * You should have received a copy of the GNU General Public License
// * along with this program.  If not, see <http://www.gnu.org/licenses/>.
// */
//package org.b3log.symphony.util.servlet;
//
//
//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;
//
//import org.b3log.latke.logging.Logger;
//
//import org.b3log.symphony.util.*;
//
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.*;
//import java.util.*;
//
///**
// * File upload to local.
// *
// * @author <a href="http://88250.b3log.org">Liang Ding</a>
// * @author <a href="http://vanessa.b3log.org">Liyuan Li</a>
// * @version 1.1.4.4, May 4, 2017
// * @since 1.4.0
// */
//public class VideoFileServlet extends HttpServlet {
//
//    private static final long serialVersionUID = 1L;
//
//    private static Logger logger = Logger.getLogger(VideoFileServlet.class);
//
//    private ServletFileUpload upload;
//
//    /**
//     * 文件上传目录
//     */
//    public static final String UPLOAD_BASE_PATH = Symphonys.get("upload.video.dir");
//
//    /**
//     * 文件web路径
//     * 线上访问地址
//     */
//    public static final String READ_PATH = Symphonys.get("read.path");
//
//    /**
//     * 视频上传统一转码格式
//     */
//    public static final String URI_VIDEO_FORMAT = Symphonys.get("video.uri.format");
//    /**
//     * 视频截图统一格式
//     */
//    public static final String URI_VIDEO_PICTURE_FORMAT = Symphonys.get("video.uri.picture.format");
//    /**
//     * 视频截图统一尺寸
//     */
//    public static final String URI_VIDEO_PICTURE_SIZE = Symphonys.get("video.uri.picture.size");
//    /**
//     * 插件FFMPEG
//     */
//    public static final String FFMPEG_COMMOND = Symphonys.get("video.commond");
//    /**
//     * 音频上传同一转码格式
//     */
//    public static final String URI_AUDIO_FORMAT = Symphonys.get("audio.uri.format");
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
//        doPost(request,response);
//    }
//
//    @Override
//    protected  void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
//
//        try{
//            List items = this.upload.parseRequest(request);
//            Iterator iter = items.iterator();
//            StringBuffer result = new StringBuffer();
//            if(result == null){
//                throw new Exception("the request doesn't contain a multipart/form-data or multipart/mixed stream");
//            }
//            while (iter.hasNext()){
//                FileItem item = (FileItem)iter.next();
//                if(!item.isFormField()){
//                    String fileName = item.getName();
//                    if(org.b3log.symphony.util.StringUtils.isEmpty(fileName)){
//                        Calendar calendar = Calendar.getInstance();
//                        File savePath = new File(UPLOAD_BASE_PATH+File.separator+String.valueOf(calendar
//                                .get(1)) +
//                                File.separator +
//                                String.valueOf(calendar
//                                        .get(2) +
//                                        1) + File.separator);
//                        if(!savePath.exists()){
//                            savePath.mkdirs();
//                            String extName = FileUtils.extName(fileName);
//                            String newFileName = DateUtils.sdf.format(new Date())+ RandomUtil.random.nextInt(1000);
//                            if(!org.b3log.symphony.util.StringUtils.isEmpty(extName)){
//                                newFileName = newFileName+"."+extName;
//                            }
//                            File saveFile = new File(savePath+File.separator+newFileName);
//                            item.write(saveFile);
//                            String path = saveFile.getAbsolutePath();
//
//                            //音频格式转码
//                            if(FFMpegUtil.checkContentTypeForAudio(path)){
//                                StringBuffer out_path = new StringBuffer();
//                                out_path.append(path.substring(0,path.lastIndexOf(".")));
//
//                                FFMpegUtil ffMpegUtil = new FFMpegUtil(FFMPEG_COMMOND,path);
//                                Integer time = Integer.valueOf(ffMpegUtil.getRuntime());
//                                out_path.append("_"+time).append(URI_AUDIO_FORMAT);
//
//                                FFMpegUtil.processFLV(path,out_path.toString());
//
//                                result.append(READ_PATH+out_path.toString().replace(UPLOAD_BASE_PATH,""));
//                                result.append(",");
//                                //视频转码
//                            }else if(FFMpegUtil.checkContentTypeForVideo(path)){
//                                StringBuffer out_path = new StringBuffer();
//                                String type = path.substring(path.lastIndexOf("."));
//                                //当不是MP4格式的时候，才转换格式（转成MP4）
//                                if(!".mp4".equals(type)){
//                                    out_path.append(path.substring(0,path.lastIndexOf(".")));
//                                    FFMpegUtil ffMpegUtil = new FFMpegUtil(FFMPEG_COMMOND,path);
//                                    Integer time = Integer.valueOf(ffMpegUtil.getRuntime());
//                                    out_path.append("_").append(time).append(URI_VIDEO_FORMAT);
//
//                                    FFMpegUtil.processFLV(path,out_path.toString());
//                                }else{
//                                    out_path.append(path);
//                                }
//                                result.append(READ_PATH+out_path.toString().replace(UPLOAD_BASE_PATH,""));
//                                //加“|”隔开视频web地址与视频截图web地址
//                                result.append("|");
//
//                                FFMpegUtil ffMpegUtil = new FFMpegUtil(FFMPEG_COMMOND,path);
//
//                                //截取视频的一帧图片（图片保存的位置与视频在同一目录）
//
//                                StringBuffer img_out_path = new StringBuffer();
//
//                                img_out_path.append(path.substring(0,path.indexOf(".")));
//
//                                img_out_path.append("_").append(ffMpegUtil.getRuntime()).append("_")
//                                        .append(URI_VIDEO_PICTURE_SIZE).append(URI_VIDEO_PICTURE_FORMAT);
//                                FFMpegUtil.makeScreenCut(path, img_out_path.toString(), URI_VIDEO_PICTURE_SIZE);
//
//
//                                result.append(READ_PATH + img_out_path.toString().replace(UPLOAD_BASE_PATH, ""));
//                                result.append(",");
//
//                            }else{
//                                //其他格式原样保存
//                                result.append(READ_PATH+saveFile.getAbsolutePath().replace(UPLOAD_BASE_PATH,""));
//                                result.append(",");
//                            }
//                        }
//                    }
//                }
//            }
//
//            String resultStr = result.length() > 0 ? result.substring(0,result.length()-1) : result.toString();
//            response.getWriter().write(resultStr);
//        }catch (Exception e){
//            logger.error(e.toString());
//        }
//
//    }
//    @Override
//    public void destroy(){
//        super.destroy();
//    }
//
//    @Override
//    public void init() throws ServletException{
//        DiskFileItemFactory factory = new DiskFileItemFactory();
//        this.upload = new ServletFileUpload(factory);
//        super.init();
//    }
//
//}
