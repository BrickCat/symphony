---
title: Windows + Nginx + FFmpeg + Video.js + video-hls.js搭建Hls流媒体点播服务器
grammar_cjkRuby: true
---



### 一、下载相关软件
 
1. Nginx
[Nginx-1.12.0 stable](http://nginx.org/en/download.html)
2. FFmpeg
[FFmpeg](http://ffmpeg.zeranoe.com/builds/)根据自己的操作系统选择下载最新的32位或64位静态程序版本。
3. video.js
[vidoe.js](http://www.jq22.com//jquery/jQueryVideo.js5.18.4.zip)下载后解压出来，这里我们只用到两个文件video.mini.js和video.css
4. videojs-contrib-hls
[videojs-contrib-hls](https://github.com/fkei/videojs-hls-demo)这是GitHub上的一个Demo，由于官网的hls.js没有编译过可能下载下来不能用，所以从该地址下载。
直接点击Clone or Download，下载下来解压缩，命令行 `cd` 到解压目录下执行 `npm install` 会把相关的 js 文件下载到node_moudel文件夹下这里我们只用到videojs.hls.js和videojs-media-sources.js还有video-js.swf文件。找到相关文件夹（应该是在最后面）把它们拷贝出来放到你的工程目录下。
### 二、安装与配置
1. Nginx
    1. 安装
    直接解压缩就好了，windows下直接点击nginx.exe就可以启动Nginx，在浏览器里访问[http://localhost](http://localhost)就可以看到Nigix的欢迎页面。由于Nginx默认使用80端口可能会被占用。
    2. 配置
        2.1 打开nginx-1.12.0 -> conf -> mime.types文件在
        ```
        application/zip          zip;
        ```
        后添加如下两行
        ```
        application/x-mpegURL 				  m3u8; 
    	application/vnd.apple.mpegurl 		  m3u8;
        ```
        在
        ```
        video/x-msvideo                       avi;
        ```
        后面添加
        ```
        video/MP2T 							  ts;
        ```
        2.2 打开nginx-1.12.0 -> conf -> nginx.conf文件
        ```
        #user  nobody;
        worker_processes  1;#要开启的进程数 一般等于cpu的总核数 其实一般情况下开4个或8个就可 我开2个
        
        #error_log  logs/error.log;
        #error_log  logs/error.log  notice;
        #error_log  logs/error.log  info;
        
        #pid        logs/nginx.pid;
        
        
        events {
            worker_connections  1024;#默认最大的并发数为1024，如果你的网站访问量过大，已经远远超过1024这个并发数，那你就要修改worker_connecions这个值 ，这个值越大，并发数也有就大。当然，你一定要按照你自己的实际情况而定，也不能设置太大，不能让你的CPU跑满100%。
        }
        
        
        http {
            include       mime.types;
            
            #解决Nginx跨域访问 Begin
            
            default_type  application/octet-stream;
        	add_header Cache-Control no-cache;
            add_header 'Access-Control-Allow-Origin' '*' always;
            add_header 'Access-Control-Expose-Headers' 'Content-Length,Content-Range';
            add_header 'Access-Control-Allow-Headers' 'Range';
            
             #解决Nginx跨域访问 End
             
            #log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
            #                  '$status $body_bytes_sent "$http_referer" '
            #                  '"$http_user_agent" "$http_x_forwarded_for"';
        
            #access_log  logs/access.log  main;
        
            sendfile        on;
            #tcp_nopush     on;
        
            #keepalive_timeout  0;
            keepalive_timeout  65;
        
            #gzip  on;
        
            server {
                listen       8080;#监听的的端口默认是80
                server_name  localhost;#默认就行
        
                #charset koi8-r;
        
                #access_log  logs/host.access.log  main;
                #请求路径 /
                location / {
        			#设置HTTP Response的Content-Type
        			types{
        				application/vnd.apple.mpegurl m3u8;
        				video/MP2T ts;
        			}
        			#指定访问的根目录，也是放你视频切片文件的地方，不用配置可直接访问 如：http://localhost:8080/playList.m3u8
        			root html;
                }
                #访问.mp4格式的文件
        		 location ~ .mp4 {
                    mp4;
                }
        		
                #error_page  404              /404.html;
        
                # redirect server error pages to the static page /50x.html
                #
                error_page   500 502 503 504  /50x.html;
                location = /50x.html {
                    root   html;
                }
        
                # proxy the PHP scripts to Apache listening on 127.0.0.1:80
                #
                #location ~ \.php$ {
                #    proxy_pass   http://127.0.0.1;
                #}
        
                # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
                #
                #location ~ \.php$ {
                #    root           html;
                #    fastcgi_pass   127.0.0.1:9000;
                #    fastcgi_index  index.php;
                #    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
                #    include        fastcgi_params;
                #}
        
                # deny access to .htaccess files, if Apache's document root
                # concurs with nginx's one
                #
                #location ~ /\.ht {
                #    deny  all;
                #}
            }
        
        
            # another virtual host using mix of IP-, name-, and port-based configuration
            #
            #server {
            #    listen       8000;
            #    listen       somename:8080;
            #    server_name  somename  alias  another.alias;
        
            #    location / {
            #        root   html;
            #        index  index.html index.htm;
            #    }
            #}
        
        
            # HTTPS server
            #
            #server {
            #    listen       443 ssl;
            #    server_name  localhost;
        
            #    ssl_certificate      cert.pem;
            #    ssl_certificate_key  cert.key;
        
            #    ssl_session_cache    shared:SSL:1m;
            #    ssl_session_timeout  5m;
        
            #    ssl_ciphers  HIGH:!aNULL:!MD5;
            #    ssl_prefer_server_ciphers  on;
        
            #    location / {
            #        root   html;
            #        index  index.html index.htm;
            #    }
            #}
        
            }
        ```
        到这里Nginx全部配置完成。
2. FFmpeg
    1. 安装
        解压缩后它会生成一个类似名为“ffmpeg-20150504-Git-eb9fb50-win32-static”的新文件夹，重命名为ffmpeg
    2. 配置
        2.1 配置环境变量
        点击“开始菜单”，再点击“控制面板”，再点击“系统与安全”，再点击“系统”，然后点击“高级系统设置”，跳出“系统属性”窗口后，最后点击“环境变量”按钮：
        ![](http://s3.51cto.com/wyfs02/M00/6C/65/wKioL1VIpZjiuDl3AAObiC2DUj4845.jpg)
        点击“环境变量”按钮后，跳出“环境变量”窗口，找到并选中“Path”变量，点击编辑：
        ![](http://s3.51cto.com/wyfs02/M02/6C/6A/wKiom1VIpWeyZg25AAF_wm3KTgk709.jpg)
        在“Path”变量原有变量值内容上加上“;d:\ffmpeg\bin”（注：;代表间隔，不可遗漏；d:\ffmpeg\bin代表FFmpeg的安装路径下的bin文件夹），一路点击“确定”即可。
        ![](http://s3.51cto.com/wyfs02/M01/6C/6A/wKiom1VIp1uSCFZyAAF3BXe18Jw236.jpg)
        打开命令提示符窗口。输入命令“ffmpeg  –version”。如果命令提示窗口返回FFmpeg的版本信息，那么就说明安装成功了，你可以在命令提示行中任意文件夹下运行FFmpeg。
        ![](http://s3.51cto.com/wyfs02/M01/6C/66/wKioL1VIqXLi-jYVAANfAKVi_Tk312.jpg)
3. Video.js
    1. 安装
        解压拷贝到项目目录中
    2. 配置
        2.1 在页面中引入css和js文件。
        ```
        <link href="/js/lib/video.js/css/video-js.css" rel="stylesheet">
        <script src="/js/lib/video.js/js/video.min.js"></script>
        ```
        2.2 设置flash路径
        Video.js会在不支持html5的浏览中使用flash播放视频文件
        ```
        <script>
             videojs.options.flash.swf = "video-js.swf";
        </script>
        ```
        2.3 html
        poster="**"播放初始图。可使用三种视频格式，根据所需要格式选择对应的。忽略的video标签中的数字~~~
        ```
        <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="640" height="264"
              poster="http://video-js.zencoder.com/oceans-clip.png"
              data-setup="{}">
            <source src="http://视频地址格式1.mp4" type='video/mp4' />
            <source src="http://视频地址格式2.webm" type='video/webm' />
            <source src="http://视频地址格式3.ogv" type='video/ogg' />
            <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
            <track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
        </video>
        ```
        设置自动播放将下面代码加到html中代码后面
        ```
        <script type="text/javascript">
            var myPlayer = videojs('example_video_1');
            videojs("example_video_1").ready(function(){
                var myPlayer = this;
                myPlayer.play();
            });
        </script>
        ```
        [Video.js](http://www.jq22.com/jquery-info404)的具体使用方法参照。
4. videojs-contrib-hls
    1. 安装
        解压拷贝js文件放到工程目录下
    2. 配置
        2.1 引入文件
        ```
        <script src="/js/lib/video.js/js/videojs-media-sources.js"></script>
        <script src="/js/lib/video.js/js/videojs.hls.js"></script>
        ```
        2.2 html
        ```
        <video id="my-video" class="video-js vjs-default-skin" controls preload="meta" width="840" height="384" poster="" data-setup='{}'>
            <source src="http://localhost:8080/playList.m3u8"
                        type="application/x-mpegURL">
        </video>
        ```
5. 视频切片与访问
    1. 切片
    命令：
        `
            ffmpeg -i output.mp4 -c:v libx264 -c:a aac -strict -2 -f hls -hls_list_size 0 -hls_time 5 output.m3u8
        `
        输入与输出的文件都可以添加路径。如：`ffmpeg -i C:\Users\Desktop\output.mp4 -c:v libx264 -c:a aac -strict -2 -f hls -hls_list_size 0 -hls_time 5 C:\Users\Desktop\nginx-1.12.0\html\output.m3u8`
        
        `-hls_list_size` n:设置播放列表保存的最多条目，设置为0会保存有所片信息，默认值为5。
        `-hls_time` n: 设置每片的长度，默认值为2。单位为秒。
    2. 访问
        修改`video`标签里`source`的`src`属性为你的nginx访问地址+你生成的`m3u8`文件。如：`http://192.168.1.110:8080/playList.m3u8`
    3. video标签解决跨域
    在html页面中添加
        ```
        <meta http-equiv="Access-Control-Allow-Origin" content="*">
        ```
6. 参考
    http://www.jq22.com/jquery-info404
    http://blog.csdn.net/yy3097/article/details/51063950
    http://www.oschina.net/question/554705_2199600?from=mail-notify

