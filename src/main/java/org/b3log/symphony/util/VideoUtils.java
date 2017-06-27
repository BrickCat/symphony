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
        commands.add(ffmpegPath+"\\bin\\ffmpeg.exe");//这里设置ffmpeg.exe存放的路径
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
        commands.add("157*94");//这里设置输出图片的大小
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
    /**
     * 获得视频缩略图，获取成功返回true，获取失败返回false
     * @param videoPath   是视频文件的存放路径
     * @param outM3u8Path 输出缩略图的保存路径
     * @return
     */
    public static boolean getVideoM3u8(String videoPath, String outM3u8Path) throws IOException {
        //ffmpeg -i output.mp4 -c:v libx264 -c:a aac -strict -2 -f hls -hls_list_size 0 -hls_time 5 output1.m3u8
        //设置参数
        final ServletContext servletContext = AbstractServletListener.getServletContext();
        final String ffmpegPath = servletContext.getRealPath("ffmpeg");
        List<String> commands = new java.util.ArrayList<String>();
        commands.add("C:\\work\\ffmpeg\\bin\\ffmpeg.exe");//这里设置ffmpeg.exe存放的路径
        commands.add("-i");
        commands.add(videoPath);
        commands.add("-c:v");
        commands.add("libx264");
        commands.add("-c:a");
        commands.add("aac");
        commands.add("-strict");
        commands.add("-2");
        commands.add("-f");
        commands.add("hls");
        commands.add("-hls_list_size");//-hls_list_size n:设置播放列表保存的最多条目，设置为0会保存有所片信息，默认值为5
        commands.add("0");
        commands.add("-hls_time");//-hls_time n: 设置每片的长度，默认值为2。单位为秒
        commands.add("10");
        commands.add(outM3u8Path);
        //-hls_wrap n:设置多少片之后开始覆盖，如果设置为0则不会覆盖，默认值为0.这个选项能够避免在磁盘上存储过多的片，而且能够限制写入磁盘的最多的片的数量
        //-hls_start_number n:设置播放列表中sequence number的值为number，默认值为0
        try {
            //切片
            ProcessBuilder builder = new ProcessBuilder();
            System.out.print(commands);
            builder.command(commands);
            builder.start();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public static void main(String arg[]){
        String videoPath = "C:\\Users\\860117030\\Desktop\\out.mp4";
        String outputPaht = "C:\\Users\\860117030\\Desktop\\newfgsdg.m3u8";
        try {
            Boolean flag = getVideoM3u8(videoPath,outputPaht);
            System.out.print(flag);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
