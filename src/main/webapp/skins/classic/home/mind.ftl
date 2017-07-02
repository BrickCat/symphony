<#include "macro-home.ftl">
<@home "${type}">
<div class="tabs-sub fn-clear">
    <a pjax-title="${articleLabel} - ${user.userName} - ${symphonyLabel}" href="${servePath}/member/${user.userName}"<#if type == "home"> class="current"</#if>>${articleLabel}<#if type == "home"> &nbsp;<span class="count">${paginationRecordCount?c}</span></#if></a>
    <a pjax-title="${cmtLabel} - ${user.userName} - ${symphonyLabel}" href="${servePath}/member/${user.userName}/comments"<#if type == "comments"> class="current"</#if>>${cmtLabel}</a>
    <#if currentUser?? && currentUser.userName == user.userName>
    <a pjax-title="${anonymousArticleLabel} - ${user.userName} - ${symphonyLabel}"<#if type == "articlesAnonymous"> class="current"</#if> href="${servePath}/member/${user.userName}/articles/anonymous">${anonymousArticleLabel}<#if type == "articlesAnonymous"> &nbsp;<span class="count">${paginationRecordCount?c}</span></#if></a>
    <a pjax-title="${anonymousCommentLabel} - ${user.userName} - ${symphonyLabel}"<#if type == "commentsAnonymous"> class="current"</#if> href="${servePath}/member/${user.userName}/comments/anonymous">${anonymousCommentLabel}</a>
    <a pjax-title="${currentMindLabel} - ${user.userName} - ${symphonyLabel}"<#if type == "currentMind"> class="current"</#if> href="${servePath}/member/${user.userName}/mind/current">${currentMindLabel}</a>
    </#if>
    <link type="text/css" rel="stylesheet" href="${staticServePath}/js/lib/jsmind/style/jsmind.css">
    <style type="text/css">
        #jsmind_nav{width:210px;height:400px;border:solid 1px #ccc;overflow:auto;float:left;}
        .file_input{width:100px;}
        button.sub{width:100px;}
        #jsmind_container{
            float:left;
            width:700px;
            height:400px;
            border:solid 1px #ccc;
            background:#f4f4f4;
        }
    </style>
</div>
<#if 0 == user.userArticleStatus || (isLoggedIn && ("adminRole" == currentUser.userRole || currentUser.userName == user.userName))>
<div class="list">
    <div id="jsmind_nav">
        <div>1. Open</div>
        <ol type='A'>
            <li><button onclick="open_json();">open example</button></li>
            <li><button onclick="open_ajax();">open remote</button></li>
            <li><button onclick="prompt_info('see 6.Multi Format');">open local file</button></li>
            <li><button onclick="prompt_info('see 6.Multi Format');">save local file</button></li>
            <li><button onclick="screen_shot();">screenshot</button></li>
        </ol>
        </ol>
        <div>2. Select &amp; Toggle</div>
        <ol type='A'>
            <li><button onclick="select_node();">select a node</button></li>
            <li><button onclick="prompt_info('please try click a node');">try click a node</button></li>
            <li><button onclick="show_selected();">get the selected</button></li>
        </ol>
        <div>3. Edit</div>
        <ol type='A'>
            <li><button onclick="toggle_editable(this);">disable editable</button></li>
            <li><button onclick="add_node();">add a node</button></li>
            <li><button onclick="add_image_node();">add a image node</button></li>
            <li><button onclick="modify_node();">modify node</button></li>
            <li><button onclick="prompt_info('please try double click a node');">try double click</button></li>
            <li><button onclick="move_node();">move a node</button></li>
            <li><button onclick="move_to_first();">move to first</button></li>
            <li><button onclick="move_to_last();">move to last</button></li>
            <li><button onclick="remove_node();">remove node</button></li>
        </ol>
        <div>4. Style</div>
        <ol type='A'>
            <li><button onclick="change_text_font();">change font</button></li>
            <li><button onclick="change_text_color();">change color</button></li>
            <li><button onclick="change_background_color();">change bg-color</button></li>
            <li><button onclick="change_background_image();">change background</button></li>
        </ol>
        <div>5. Theme</div>
        <ol type='A'>
            <li>
                <select onchange="set_theme(this.value);">
                    <option value="">default</option>
                    <option value="primary">primary</option>
                    <option value="warning">warning</option>
                    <option value="danger">danger</option>
                    <option value="success">success</option>
                    <option value="info">info</option>
                    <option value="greensea" selected="selected">greensea</option>
                    <option value="nephrite">nephrite</option>
                    <option value="belizehole">belizehole</option>
                    <option value="wisteria">wisteria</option>
                    <option value="asphalt">asphalt</option>
                    <option value="orange">orange</option>
                    <option value="pumpkin">pumpkin</option>
                    <option value="pomegranate">pomegranate</option>
                    <option value="clouds">clouds</option>
                    <option value="asbestos">asbestos</option>
                </select>
            </li>
        </ol>
        <div>6. Adjusting</div>
        <ol type='A'>
            <li><button onclick="change_container();">resize container</button>
                <button onclick="resize_jsmind();">adusting</button></li>
            <li>expand/collapse</li>
            <ol>
                <li><button class="sub" onclick="expand();">expand node</button></li>
                <li><button class="sub" onclick="collapse();">collapse node</button></li>
                <li><button class="sub" onclick="toggle();">toggle node</button></li>
                <li><button class="sub" onclick="expand_to_level2();">expand to level 2</button></li>
                <li><button class="sub" onclick="expand_to_level3();">expand to level 3</button></li>
                <li><button class="sub" onclick="expand_all();">expand all</button></li>
                <li><button class="sub" onclick="collapse_all();">collapse all</button></li>
            </ol>
            <li>zoom</li>

            <button id="zoom-in-button" style="width:50px" onclick="zoomIn();">
                In
            </button>
            <button id="zoom-out-button" style="width:50px" onclick="zoomOut();">
                Out
            </button>
        </ol>

        <div>7. Multi Format</div>
        <ol type='A'>
            <li>node_tree(default)</li>
            <ol>
                <li><button class="sub" onclick="show_data();">show data</button></li>
                <li><button class="sub" onclick="save_file();">save file</button></li>
                <li><input id="file_input" class="file_input" type="file"/></li>
                <li><button class="sub" onclick="open_file();">open file</button></li>
            </ol>
            <li>node_array</li>
            <ol>
                <li><button class="sub" onclick="get_nodearray_data();">show data</button></li>
                <li><button class="sub" onclick="save_nodearray_file();">save file</button></li>
                <li><input id="file_input_nodearray" class="file_input" type="file"/></li>
                <li><button class="sub" onclick="open_nodearray();">open file</button></li>
            </ol>
            <li>freemind(.mm)</li>
            <ol>
                <li><button class="sub" onclick="get_freemind_data();">show data</button></li>
                <li><button class="sub" onclick="save_freemind_file();">save file</button></li>
                <li><input id="file_input_freemind" class="file_input" type="file"/></li>
                <li><button class="sub" onclick="open_freemind();">open file</button></li>
            </ol>
        </ol>
    </div>

    <div id="jsmind_container"></div>

    <div style="display:none">
        <input class="file" type="file" id="image-chooser" accept="image/*"/>
    </div>
</div>

<script type="text/javascript" src="${staticServePath}/js/lib/jsmind/js/jsmind.js"></script>
<script type="text/javascript" src="${staticServePath}/js/lib/jsmind/js/jsmind.draggable.js"></script>
<script type="text/javascript" src="${staticServePath}/js/lib/jsmind/js/jsmind.screenshot.js"></script>

<script type="text/javascript">
    var _jm = null;
    function open_empty(){
        var options = {
            container:'jsmind_container',
            theme:'greensea',
            editable:true
        }
        _jm = jsMind.show(options);
        // _jm = jsMind.show(options,mind);
    }

    function open_json(){
        var mind = {
            "meta":{
                "name":"jsMind remote",
                "author":"hizzgdev@163.com",
                "version":"0.2"
            },
            "format":"node_tree",
            "data":{"id":"root","topic":"jsMind","children":[
                {"id":"easy","topic":"Easy","direction":"left","children":[
                    {"id":"easy1","topic":"Easy to show"},
                    {"id":"easy2","topic":"Easy to edit"},
                    {"id":"easy3","topic":"Easy to store"},
                    {"id":"easy4","topic":"Easy to embed"},
                    {"id":"other3","background-image":"ant.png", "width": "100", "height": "100"}
                ]},
                {"id":"open","topic":"Open Source","direction":"right","children":[
                    {"id":"open1","topic":"on GitHub", "background-color":"#eee", "foreground-color":"blue"},
                    {"id":"open2","topic":"BSD License"}
                ]},
                {"id":"powerful","topic":"Powerful","direction":"right","children":[
                    {"id":"powerful1","topic":"Base on Javascript"},
                    {"id":"powerful2","topic":"Base on HTML5"},
                    {"id":"powerful3","topic":"Depends on you"}
                ]},
                {"id":"other","topic":"test node","direction":"left","children":[
                    {"id":"other1","topic":"I'm from local variable"},
                    {"id":"other2","topic":"I can do everything"}
                ]}
            ]}
        }
        _jm.show(mind);
    }

    function open_ajax(){
        var mind_url = 'data_example.json';
        jsMind.util.ajax.get(mind_url,function(mind){
            _jm.show(mind);
        });
    }

    function screen_shot(){
        _jm.screenshot.shootDownload();
    }

    function show_data(){
        var mind_data = _jm.get_data();
        var mind_string = jsMind.util.json.json2string(mind_data);
        prompt_info(mind_string);
    }

    function save_file(){
        var mind_data = _jm.get_data();
        var mind_name = mind_data.meta.name;
        var mind_str = jsMind.util.json.json2string(mind_data);
        jsMind.util.file.save(mind_str,'text/jsmind',mind_name+'.jm');
    }

    function open_file(){
        var file_input = document.getElementById('file_input');
        var files = file_input.files;
        if(files.length > 0){
            var file_data = files[0];
            jsMind.util.file.read(file_data,function(jsmind_data, jsmind_name){
                var mind = jsMind.util.json.string2json(jsmind_data);
                if(!!mind){
                    _jm.show(mind);
                }else{
                    prompt_info('can not open this file as mindmap');
                }
            });
        }else{
            prompt_info('please choose a file first')
        }
    }

    function select_node(){
        var nodeid = 'other';
        _jm.select_node(nodeid);
    }

    function show_selected(){
        var selected_node = _jm.get_selected_node();
        if(!!selected_node){
            prompt_info(selected_node.topic);
        }else{
            prompt_info('nothing');
        }
    }

    function get_selected_nodeid(){
        var selected_node = _jm.get_selected_node();
        if(!!selected_node){
            return selected_node.id;
        }else{
            return null;
        }
    }

    function add_node(){
        var selected_node = _jm.get_selected_node(); // as parent of new node
        if(!selected_node){prompt_info('please select a node first.');return;}

        var nodeid = jsMind.util.uuid.newid();
        var topic = '* Node_'+nodeid.substr(0,5)+' *';
        var node = _jm.add_node(selected_node, nodeid, topic);
    }

    var imageChooser = document.getElementById('image-chooser');

    imageChooser.addEventListener('change', function (event) {
        // Read file here.
        var reader = new FileReader();
        reader.onloadend = (function () {
            var selected_node = _jm.get_selected_node();
            var nodeid = jsMind.util.uuid.newid();
            var topic = undefined;
            var data = {
                "background-image": reader.result,
                "width": "100",
                "height": "100"};
            var node = _jm.add_node(selected_node, nodeid, topic, data);
            //var node = _jm.add_image_node(selected_node, nodeid, reader.result, 100, 100);
            //add_image_node:function(parent_node, nodeid, image, width, height, data, idx, direction, expanded){
        });

        var file = imageChooser.files[0];
        if (file) {
            reader.readAsDataURL(file);
        };

    }, false);

    function add_image_node(){
        var selected_node = _jm.get_selected_node(); // as parent of new node
        if(!selected_node){
            prompt_info('please select a node first.');
            return;
        }

        imageChooser.focus();
        imageChooser.click();
    }

    function modify_node(){
        var selected_id = get_selected_nodeid();
        if(!selected_id){prompt_info('please select a node first.');return;}

        // modify the topic
        _jm.update_node(selected_id, '--- modified ---');
    }

    function move_to_first(){
        var selected_id = get_selected_nodeid();
        if(!selected_id){prompt_info('please select a node first.');return;}

        _jm.move_node(selected_id,'_first_');
    }

    function move_to_last(){
        var selected_id = get_selected_nodeid();
        if(!selected_id){prompt_info('please select a node first.');return;}

        _jm.move_node(selected_id,'_last_');
    }

    function move_node(){
        // move a node before another
        _jm.move_node('other','open');
    }

    function remove_node(){
        var selected_id = get_selected_nodeid();
        if(!selected_id){prompt_info('please select a node first.');return;}

        _jm.remove_node(selected_id);
    }

    function change_text_font(){
        var selected_id = get_selected_nodeid();
        if(!selected_id){prompt_info('please select a node first.');return;}

        _jm.set_node_font_style(selected_id, 28);
    }

    function change_text_color(){
        var selected_id = get_selected_nodeid();
        if(!selected_id){prompt_info('please select a node first.');return;}

        _jm.set_node_color(selected_id, null, '#000');
    }

    function change_background_color(){
        var selected_id = get_selected_nodeid();
        if(!selected_id){prompt_info('please select a node first.');return;}

        _jm.set_node_color(selected_id, '#eee', null);
    }

    function change_background_image(){
        var selected_id = get_selected_nodeid();
        if(!selected_id){prompt_info('please select a node first.');return;}

        _jm.set_node_background_image(selected_id, 'ant.png', 100, 100);
    }

    function set_theme(theme_name){
        _jm.set_theme(theme_name);
    }

    var zoomInButton = document.getElementById("zoom-in-button");
    var zoomOutButton = document.getElementById("zoom-out-button");

    function zoomIn() {
        if (_jm.view.zoomIn()) {
            zoomOutButton.disabled = false;
        } else {
            zoomInButton.disabled = true;
        };
    };

    function zoomOut() {
        if (_jm.view.zoomOut()) {
            zoomInButton.disabled = false;
        } else {
            zoomOutButton.disabled = true;
        };
    };

    function toggle_editable(btn){
        var editable = _jm.get_editable();
        if(editable){
            _jm.disable_edit();
            btn.innerHTML = 'enable editable';
        }else{
            _jm.enable_edit();
            btn.innerHTML = 'disable editable';
        }
    }

    // this method change size of container, perpare for adjusting jsmind
    function change_container(){
        var c = document.getElementById('jsmind_container');
        c.style.width = '700px';
        c.style.height = '400px';
    }

    function resize_jsmind(){
        _jm.resize();
    }

    function expand(){
        var selected_id = get_selected_nodeid();
        if(!selected_id){prompt_info('please select a node first.');return;}

        _jm.expand_node(selected_id);
    }

    function collapse(){
        var selected_id = get_selected_nodeid();
        if(!selected_id){prompt_info('please select a node first.');return;}

        _jm.collapse_node(selected_id);
    }

    function toggle(){
        var selected_id = get_selected_nodeid();
        if(!selected_id){prompt_info('please select a node first.');return;}

        _jm.toggle_node(selected_id);
    }

    function expand_all(){
        _jm.expand_all();
    }

    function expand_to_level2(){
        _jm.expand_to_depth(2);
    }

    function expand_to_level3(){
        _jm.expand_to_depth(3);
    }

    function collapse_all(){
        _jm.collapse_all();
    }


    function get_nodearray_data(){
        var mind_data = _jm.get_data('node_array');
        var mind_string = jsMind.util.json.json2string(mind_data);
        prompt_info(mind_string);
    }

    function save_nodearray_file(){
        var mind_data = _jm.get_data('node_array');
        var mind_name = mind_data.meta.name;
        var mind_str = jsMind.util.json.json2string(mind_data);
        jsMind.util.file.save(mind_str,'text/jsmind',mind_name+'.jm');
    }

    function open_nodearray(){
        var file_input = document.getElementById('file_input_nodearray');
        var files = file_input.files;
        if(files.length > 0){
            var file_data = files[0];
            jsMind.util.file.read(file_data,function(jsmind_data, jsmind_name){
                var mind = jsMind.util.json.string2json(jsmind_data);
                if(!!mind){
                    _jm.show(mind);
                }else{
                    prompt_info('can not open this file as mindmap');
                }
            });
        }else{
            prompt_info('please choose a file first')
        }
    }

    function get_freemind_data(){
        var mind_data = _jm.get_data('freemind');
        var mind_string = jsMind.util.json.json2string(mind_data);
        alert(mind_string);
    }

    function save_freemind_file(){
        var mind_data = _jm.get_data('freemind');
        var mind_name = mind_data.meta.name || 'freemind';
        var mind_str = mind_data.data;
        jsMind.util.file.save(mind_str,'text/xml',mind_name+'.mm');
    }

    function open_freemind(){
        var file_input = document.getElementById('file_input_freemind');
        var files = file_input.files;
        if(files.length > 0){
            var file_data = files[0];
            jsMind.util.file.read(file_data, function(freemind_data, freemind_name){
                if(freemind_data){
                    var mind_name = freemind_name;
                    if(/.*\.mm$/.test(mind_name)){
                        mind_name = freemind_name.substring(0,freemind_name.length-3);
                    }
                    var mind = {
                        "meta":{
                            "name":mind_name,
                            "author":"hizzgdev@163.com",
                            "version":"1.0.1"
                        },
                        "format":"freemind",
                        "data":freemind_data
                    };
                    _jm.show(mind);
                }else{
                    prompt_info('can not open this file as mindmap');
                }
            });
        }else{
            prompt_info('please choose a file first')
        }
    }

    function prompt_info(msg){
        alert(msg);
    }

    open_empty();

</script>

<#else>
<p class="ft-center ft-gray home-invisible">${setinvisibleLabel}</p>
</#if>
</@home>