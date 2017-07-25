package org.b3log.symphony.util;

//import com.sun.image.codec.jpeg.JPEGCodec;
//import com.sun.image.codec.jpeg.JPEGImageEncoder;
import net.coobird.thumbnailator.Thumbnails;
import org.apache.commons.lang3.StringEscapeUtils;


import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by 860117030 on 2017/6/30.
 */
public class TrendUtils {

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

    public static void gifHandle(final String gifPath,final String gifImgPath) throws IOException {
        try {
            File f = new File(gifPath);
            f.canRead();
            BufferedImage src = ImageIO.read(f);
            ImageIO.write(src, "png", new File(gifImgPath));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
