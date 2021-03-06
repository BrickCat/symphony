/*
 * Symphony - A modern community (forum/SNS/blog) platform written in Java.
 * Copyright (C) 2012-2017,  b3log.org & hacpai.com
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.b3log.symphony.processor;

import jodd.io.FileUtil;
import jodd.upload.MultipartRequestInputStream;
import jodd.util.MimeTypes;
import jodd.util.URLDecoder;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.b3log.latke.Keys;
import org.b3log.latke.Latkes;
import org.b3log.latke.ioc.LatkeBeanManager;
import org.b3log.latke.ioc.Lifecycle;
import org.b3log.latke.ioc.inject.Inject;
import org.b3log.latke.logging.Level;
import org.b3log.latke.logging.Logger;
import org.b3log.latke.model.User;
import org.b3log.latke.service.ServiceException;
import org.b3log.latke.util.CollectionUtils;
import org.b3log.latke.util.MD5;
import org.b3log.symphony.SymphonyServletListener;
import org.b3log.symphony.model.Role;
import org.b3log.symphony.model.Tag;
import org.b3log.symphony.model.Video;
import org.b3log.symphony.model.VideoSize;
import org.b3log.symphony.service.*;
import org.b3log.symphony.util.Symphonys;
import org.b3log.symphony.util.VideoUtils;
import org.json.JSONObject;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * File upload to local.
 *
 * @author <a href="http://88250.b3log.org">Liang Ding</a>
 * @author <a href="http://vanessa.b3log.org">Liyuan Li</a>
 * @version 1.1.4.4, May 4, 2017
 * @since 1.4.0
 */
@WebServlet(urlPatterns = {"/upload", "/upload/*"}, loadOnStartup = 2)
public class FileUploadServlet extends HttpServlet {

    /**
     * Serial version UID.
     */
    private static final long serialVersionUID = 1L;

    /**
     * Logger.
     */
    private static final Logger LOGGER = Logger.getLogger(FileUploadServlet.class);

    /**
     * Upload directory.
     */
    private static final String UPLOAD_DIR = Symphonys.get("upload.dir");

    /**
     * Qiniu enabled.
     */
    private static final Boolean QN_ENABLED = Symphonys.getBoolean("qiniu.enabled");

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
     * Article management service.
     */
    @Inject
    final ArticleMgmtService articleMgmtService = beanManager.getReference(ArticleMgmtService.class);

    static {
        if (!QN_ENABLED) {
            final File file = new File(UPLOAD_DIR);
            if (!FileUtil.isExistingFolder(file)) {
                try {
                    FileUtil.mkdirs(UPLOAD_DIR);
                } catch (IOException ex) {
                    LOGGER.log(Level.ERROR, "Init upload dir error", ex);

                    System.exit(-1);
                }
            }

            LOGGER.info("Uses dir [" + file.getAbsolutePath() + "] for saving files uploaded");
        }
    }

    @Override
    public void doGet(final HttpServletRequest req, final HttpServletResponse resp)
            throws ServletException, IOException {
        if (QN_ENABLED) {
            return;
        }

        final String uri = req.getRequestURI();
        String key = StringUtils.substringAfter(uri, "/upload/");
        key = StringUtils.substringBeforeLast(key, "?"); // Erase Qiniu template
        key = StringUtils.substringBeforeLast(key, "?"); // Erase Qiniu template

        String path = UPLOAD_DIR + key;
        path = URLDecoder.decode(path, "UTF-8");

        if (!FileUtil.isExistingFile(new File(path))) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);

            return;
        }

        final byte[] data = IOUtils.toByteArray(new FileInputStream(path));


        final String ifNoneMatch = req.getHeader("If-None-Match");
        final String etag = "\"" + MD5.hash(new String(data)) + "\"";

        resp.addHeader("Cache-Control", "public, max-age=31536000");
        resp.addHeader("ETag", etag);
        resp.setHeader("Server", "Latke Static Server (v" + SymphonyServletListener.VERSION + ")");
        resp.addHeader("Content-Length",""+new File(path).length());
        if (etag.equals(ifNoneMatch)) {
            resp.setStatus(HttpServletResponse.SC_NOT_MODIFIED);

            return;
        }

        final OutputStream output = resp.getOutputStream();
        IOUtils.write(data, output);
        output.flush();

        IOUtils.closeQuietly(output);

    }

    @Override
    public void init(ServletConfig servletConfig) throws ServletException {
        super.init(servletConfig);
    }

    @Override
    public void doPost(final HttpServletRequest req, final HttpServletResponse resp)
            throws ServletException, IOException {
        if (QN_ENABLED) {
            return;
        }
        final MultipartRequestInputStream multipartRequestInputStream = new MultipartRequestInputStream(req.getInputStream());
        final String type = req.getParameter("type");
        String ret = null;
        if (type != null && "1".equals(type)){
            req.setCharacterEncoding("UTF-8");

            //保存路径
            String savePath ="./upload";
            File saveDir = new File(savePath);
            // 如果目录不存在，就创建目录
            if(!saveDir.exists()){
                saveDir.mkdir();
            }
            // 创建文件上传核心类
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload sfu = new ServletFileUpload(factory);
            //设置编码
            sfu.setHeaderEncoding("UTF-8");
            Map<String,Object> map = new HashMap<String,Object>();
            try{
                // 处理表单请求
                List<FileItem> itemList = sfu.parseRequest(req);

                for (FileItem fileItem : itemList) {
                    // 对应表单中的控件的name
                    String fieldName = fileItem.getFieldName();
                    // 如果是普通表单控件
                    if(fileItem.isFormField()){
                        String value = fileItem.getString();
                        //重新编码,解决乱码
                        value = new String(value.getBytes("ISO-8859-1"),"UTF-8");

                        map.put(fieldName,value);
                        // 上传文件
                    }else{
                        String videoProperty = "";
                        DecimalFormat df = new DecimalFormat("0.00");//格式化小数，不足的补0
                        // 获得文件大小
                        Long size = fileItem.getSize();
                        if(200*1024*1024 < size){
                            resp.sendRedirect(Latkes.getServePath() + "/video/front/check?type="+"MaxSize");
                            return;
                        }
                        // 获得文件名
                        String fileName = fileItem.getName();
                        //UUID
                        final String uuid = UUID.randomUUID().toString().replaceAll("-", "");

                        //获取当前用户
                        final JSONObject currentUser = (JSONObject) req.getAttribute(User.USER);
                        final String currentUserId = currentUser.optString(Keys.OBJECT_ID);

                        final JSONObject video = new JSONObject();
                        //用户ID
                        video.put(Video.VIDEO_AUTHORID,currentUserId);
                        //格式
                        String suffix = StringUtils.substringAfterLast(fileName, ".");
                        fileName = uuid+"."+suffix;
                        map.put("videoUrl","/upload/" + fileName);
                        if(!"mp4".equals(suffix)||"war".equals(suffix)||"sql".equals(suffix)){
                            resp.sendRedirect(Latkes.getServePath() + "/video/front/check?type="+"format");
                            return;
                        }
                        //videoTitle
                        if(StringUtils.isNotBlank(map.get(Video.VIDEO_TITLE).toString())){
                            video.put(Video.VIDEO_TITLE,map.get(Video.VIDEO_TITLE));
                        }else{
                            resp.sendRedirect(Latkes.getServePath() + "/video/front/check?type="+Video.VIDEO_TITLE);
                            return;
                        }

                        //videoTag
                        if (StringUtils.isNotBlank(map.get(Video.VIDEO_TAG).toString())){
                            video.put(Video.VIDEO_TAG,map.get(Video.VIDEO_TAG));
                        }else{
                            resp.sendRedirect(Latkes.getServePath() + "/video/front/check?type="+Video.VIDEO_TAG);
                            return;
                        }
                        String videoTags = video.optString(Video.VIDEO_TAG);
                        if (!Role.ROLE_ID_C_ADMIN.equals(currentUser.optString(User.USER_ROLE))) {
                            videoTags = articleMgmtService.filterReservedTags(videoTags);
                        }
                        video.put(Video.VIDEO_TAG,videoTags);
                        //videoRemarks
                        if(StringUtils.isNotBlank(map.get(Video.VIDEO_REMARKS).toString())){
                            video.put(Video.VIDEO_REMARKS,map.get(Video.VIDEO_REMARKS));
                        }else{
                            resp.sendRedirect(Latkes.getServePath() + "/video/front/check?type="+Video.VIDEO_REMARKS);
                            return;
                        }

                        //videoType
                        //判断是否需要积分打赏
                        if(StringUtils.isNotBlank(map.get(Video.VIDEO_TYPE).toString())){
                            video.put(Video.VIDEO_TYPE,map.get(Video.VIDEO_TYPE));
                            if("0".equals(map.get(Video.VIDEO_TYPE))){
                                //videoPoint
                                video.put(Video.VIDEO_POINT,0);
                            }else{
                                //videoPoint
                                if(!"".equals(map.get(Video.VIDEO_TYPE).toString())){
                                    video.put(Video.VIDEO_POINT,map.get(Video.VIDEO_POINT));
                                }else{
                                    resp.sendRedirect(Latkes.getServePath() + "/video/front/check?type="+Video.VIDEO_POINT);
                                    return;
                                }
                            }
                        }else{
                            resp.sendRedirect(Latkes.getServePath() + "/video/front/check?type="+Video.VIDEO_TYPE);
                            return;
                        }
                        //查询个人用户的空间大小
                        final JSONObject videoSize = new JSONObject();
                        videoSize.put(VideoSize.USER_ID, currentUserId);
                        final Map<String, Class<?>> videoSizeFields = new HashMap<>();
                        videoSizeFields.put(VideoSize.USER_ID,String.class);
                        videoSizeFields.put(VideoSize.USER_MAX_VIDEO_SIZE,Integer.class);
                        final JSONObject result = videoSizeQueryService.getVideoSize(videoSize,videoSizeFields);
                        final List<JSONObject> list = CollectionUtils.<JSONObject>jsonArrayToList(result.optJSONArray(VideoSize.VIDEO_SIZE));
                        if(list.size() == 0){
                            videoSize.put(VideoSize.USER_MAX_VIDEO_SIZE,500);
                            videoSizeMgmtService.addVideoSize("",videoSize);
                        }else{
                            final JSONObject currresult = videoSizeQueryService.getVideoSize(videoSize,videoSizeFields);
                            final List<JSONObject> currrlist = CollectionUtils.<JSONObject>jsonArrayToList(currresult.optJSONArray(VideoSize.VIDEO_SIZE));
                            final JSONObject currVideoSize = list.get(0);
                            //获取此用户的所有视频大小
                            final JSONObject requestJSONObject = new JSONObject();
                            requestJSONObject.put(Video.VIDEO_AUTHORID, currentUserId);
                            final Map<String, Class<?>> videoFields = new HashMap<>();
                            videoFields.put(Video.VIDEO_SIZE,Integer.class);
                            final JSONObject videoResult = videoQueryService.getUserVideoSize(requestJSONObject,videoFields);
                            final List<JSONObject> videos = CollectionUtils.jsonArrayToList(videoResult.optJSONArray(Video.VIDEOS));
                            int allSize = 0;
                            for (JSONObject v : videos) {
                                allSize+=v.optInt(Video.VIDEO_SIZE);
                            }
                            String bigSize = df.format(allSize + (float)size/1048576);
                            if(Double.parseDouble(bigSize) > currVideoSize.optDouble(VideoSize.USER_MAX_VIDEO_SIZE)){
                                if(size>currVideoSize.optInt(VideoSize.USER_MAX_VIDEO_SIZE)){
                                    resp.sendRedirect(Latkes.getServePath() + "/video/front/check?type="+(currVideoSize.optInt(VideoSize.USER_MAX_VIDEO_SIZE)-allSize));
                                    return;
                                }
                            }
                        }
                        //videoStatus
                        if(StringUtils.isNotBlank(map.get(Video.VIDEO_STATUS).toString())){
                            video.put(Video.VIDEO_STATUS,map.get(Video.VIDEO_STATUS));
                        }else{
                            resp.sendRedirect(Latkes.getServePath() + "/video/front/check?type="+Video.VIDEO_STATUS);
                            return;
                        }
                        //videoSize
                        if(size <= 0){
                            resp.sendRedirect(Latkes.getServePath() + "/video/front/check?type="+"videoSize");
                            return;
                        }else{
                            float sizes =  (float)size/1048576;
                            video.put(Video.VIDEO_SIZE,df.format(sizes));
                        }
                        //imagePath
                        String imagePath = System.getProperty( "user.dir" )+"/upload/"+uuid+".png";
                        video.put(Video.VIDEO_IMAGE_PATH,"/upload/"+uuid+".png");

                        //videoUrl
                        video.put(Video.VIDEO_URL,map.get(Video.VIDEO_URL));
                        try {
                            //保存视频信息
                            ret = videoMgmtService.addVideo("",video,req);
                        } catch (ServiceException e) {
                            e.printStackTrace();
                        }
                        //信息保存成功则上传文件
                        if (null!=ret&&!"".equals(ret)){
                            //将文件保存到指定的路径
                            File file = new File(UPLOAD_DIR,fileName);
                            fileItem.write(file);
                            if("0".equals(map.get("videoImage").toString())){
                                if(VideoUtils.getVideoImage(System.getProperty( "user.dir" )+"/upload/" + fileName,imagePath)){
                                    //跳转到视频页面
                                    resp.sendRedirect(Latkes.getServePath()+"/admin/videos");
                                }else{
                                    videoMgmtService.deleteVideo(ret);
                                }
                            }else{
                                resp.sendRedirect(Latkes.getServePath()+"/admin/videos");
                            }
                        }else{
                            resp.sendRedirect(Latkes.getServePath() + "/video/front/check?type="+"videoErrorInfo");
                            return;
                        }
                    }
                }

            }catch(FileUploadBase.FileSizeLimitExceededException e){
                req.setAttribute("msg", "文件太大");
            }catch(FileUploadException e){
                e.printStackTrace();
            }catch(Exception e){
                e.printStackTrace();
            }
        }else{

            multipartRequestInputStream.readBoundary();
            multipartRequestInputStream.readDataHeader("UTF-8");

            String fileName = multipartRequestInputStream.getLastHeader().getFileName();

            String suffix = StringUtils.substringAfterLast(fileName, ".");
            if (StringUtils.isBlank(suffix)) {
                final String mimeType = multipartRequestInputStream.getLastHeader().getContentType();
                String[] exts = MimeTypes.findExtensionsByMimeTypes(mimeType, false);

                if (null != exts && 0 < exts.length) {
                    suffix = exts[0];
                } else {
                    suffix = StringUtils.substringAfter(mimeType, "/");
                }
            }

            final String name = StringUtils.substringBeforeLast(fileName, ".");
            final String processName = name.replaceAll("\\W", "");
            final String uuid = UUID.randomUUID().toString().replaceAll("-", "");

            if (StringUtils.isBlank(processName)) {
                fileName = uuid + "." + suffix;
            } else {
                fileName = uuid + '_' + processName + "." + suffix;
            }

            final OutputStream output = new FileOutputStream(UPLOAD_DIR + fileName);
            IOUtils.copy(multipartRequestInputStream, output);

            IOUtils.closeQuietly(multipartRequestInputStream);
            IOUtils.closeQuietly(output);

            final JSONObject data = new JSONObject();

            data.put("key", Latkes.getServePath() + "/upload/" + fileName);
            data.put("name", fileName);

            resp.setContentType("application/json");

            final PrintWriter writer = resp.getWriter();
            writer.append(data.toString());
            writer.flush();
            writer.close();
        }

    }
}
