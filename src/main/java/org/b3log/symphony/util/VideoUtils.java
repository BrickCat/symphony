package org.b3log.symphony.util;

import org.b3log.latke.servlet.AbstractServletListener;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by Seven on 17/5/14.
 */
public class VideoUtils {
    /**
     * 获得视频缩略图，获取成功返回true，获取失败返回false
     * @param videoPath   是视频文件的存放路径
     * @param outImagePath 输出缩略图的保存路径
     * @return
     */
    public static boolean getVideoImage(String videoPath, String outImagePath) throws IOException {
        //设置参数
        final ServletContext servletContext = AbstractServletListener.getServletContext();
        final String ffmpegPath = servletContext.getRealPath("ffmpeg");
        List<String> commands = new java.util.ArrayList<String>();
        commands.add(ffmpegPath+"\\ffmpeg.exe");//这里设置ffmpeg.exe存放的路径
        commands.add("-i");
        commands.add(videoPath);//这里是设置要截取缩略图的视频的路径
        commands.add("-y");
        commands.add("-f");
        commands.add("image2");
        commands.add("-ss");
        commands.add("4");//这里设置的是要截取视频开始播放多少秒后的图，可以自己设置时间
        commands.add("-t");
        commands.add("0.001");
        commands.add("-s");
        commands.add("142*142");//这里设置输出图片的大小
        commands.add(outImagePath);//这里设置输出的截图的保存路径

        try {
            //截取缩略图并保存
            ProcessBuilder builder = new ProcessBuilder();
            builder.command(commands);
            builder.start();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
