package org.b3log.symphony;

/**
 * Created by Seven on 17/5/23.
 */
public class TODO {
    /**
     * 前台
     */
    //TODO 前台页面的样式展示，不能雷同黑客派
    //TODO 网站的定位 程序员与健身（两个大的领域向下细分）
    //
    /**
     * 视频管理
     */
    //TODO 视频的增删改查（高）
    //0.####新增或修改后，插入成功后把对象返回到前台，以便根据ID判断新增修改
    //1.####新增和修改根据ID查询Video对象是否为空来判断更新或新增
    //2.####视频上传后，保存VideoURL到数据库
    //3.####视频查询
    //4.#视频播放
    //5.###视频删除
    //6.判断视频格式、视频转码
    //7.#前台视频列表，瀑布流

    //TODO 并发上传、下载！！！
    //服务器搭建
    //http://www.cnblogs.com/tinywan/p/6692098.html
    //切片
    //http://www.oschina.net/question/554705_2199600?from=mail-notify
    //编译
    //http://www.92to.com/bangong/2017/05-22/22150279.html
    //命令
    //ffmpeg -i output.mp4 -c:v libx264 -c:a aac -strict -2 -f hls -hls_list_size 0 -hls_time 5 output1.m3u8

    /**
     * 后台
     */
    //TODO 视频重新上传，先老视频删除再上传

    //TODO 上传视频空间限制，积分购买（增加字段videoSize,根据size判断）user表增加uploadSize字段

    //TODO 视频修改完善

    //TODO 视频瀑布流，前台列表展示页
    //TODO 视频详情页面展示（计数，是否可下载）
    //TODO 赞，评论
    //TODO 上传视频格式转换（中级）（fileuploadservlet）
    //

    /**
     * Future
     */
    //TODO 增加商城功能
    //TODO 微博九图功能


    //TODO 上传视频格式转换（中级）
    //TODO 增加其他用户上传视频的功能
    //TODO 前台页面的样式展示，不能雷同黑客派
    //TODO 网站的定位 程序员与健身（两个大的领域向下细分）

}
