package org.b3log.symphony.util;

import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;
import org.apache.commons.lang3.StringEscapeUtils;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by 860117030 on 2017/6/30.
 */
public class TrendUtils {
    /**
     * 缩略字符串（不区分中英文字符）
     * @param str 目标字符串
     * @param length 截取长度
     * @return
     */
    public static String abbr(String str, int length) {
        if (str == null) {
            return "";
        }
        try {
            StringBuilder sb = new StringBuilder();
            int currentLength = 0;
            for (char c : replaceHtml(StringEscapeUtils.unescapeHtml4(str)).toCharArray()) {
                currentLength += String.valueOf(c).getBytes("GBK").length;
                if (currentLength <= length - 3) {
                    sb.append(c);
                } else {
                    sb.append("...");
                    break;
                }
            }
            return sb.toString();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "";
    }
    /**
     * 替换掉HTML标签方法
     */
    public static String replaceHtml(String html) {
        if (StringUtils.isEmpty(html)){
            return "";
        }
        String regEx = "<.+?>";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(html);
        String s = m.replaceAll("");
        return s;
    }

    /**
     * @param standardImgPath 原图片path
     * @param thumName 缩略图path
     */
    public static String storeThumbnail(String standardImgPath, String thumName,String thumbPath) {
        File file = new File(standardImgPath);
        File thumbFile = new File(thumbPath);
        if(file!=null&&file.isFile()){
            try {
                if (!thumbFile.exists()) {
                    thumbFile.mkdir();
                }
                File outFIle = new File(thumbPath+"/"+thumName);
                //scale(比例)
                //watermark(位置，水印图，透明度).watermark(Positions.BOTTOM_RIGHT, ImageIO.read(new File("images/watermark.png")), 0.5f)
                Thumbnails.of(file).scale(0.25f).outputQuality(0.8f) .toFile(outFIle);
                return outFIle.getName();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
