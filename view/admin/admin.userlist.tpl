<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>首页--layui后台管理模板 2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="static/iframe/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="static/iframe/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="static/iframe/css/public.css" media="all" />

    <link rel="stylesheet" href="static/iframe/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/iframe/bootstrap-table/src/bootstrap-table.css">
</head>
<body class="childrenBody">
<form class="layui-form">
    <blockquote class="layui-elem-quote quoteBox">
        <form class="layui-form">
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <input type="text" class="layui-input searchVal" placeholder="请输入搜索的内容" />
                </div>
                <a class="layui-btn search_btn" data-type="reload">搜索</a>
            </div>
            <div class="layui-inline">
                <a class="layui-btn layui-btn-normal addNews_btn">添加用户</a>
            </div>
            <div class="layui-inline">
                <a class="layui-btn layui-btn-danger layui-btn-normal delAll_btn">批量删除</a>
            </div>
        </form>
    </blockquote>
    <table id="userList" lay-filter="userList"></table>
    <!--操作-->
    <script type="text/html" id="userListBar">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="usable">已启用</a>
        <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
    </script>
</form>
<script>
    var getlisturl = '<{$getlisturl}>';
    var addurl = '<{$addurl}>';
</script>
<script type="text/javascript" src="static/iframe/layui/layui.js"></script>

<script src="static/iframe/bootstrap/js/bootstrap.min.js"></script>
<script src="static/iframe/bootstrap-table/src/bootstrap-table.js"></script>
<script src="static/iframe/bootstrap-table/src/extensions/mobile/bootstrap-table-mobile.js"></script>
<script src="static/iframe/bootstrap-table/src/extensions/editable/bootstrap-table-editable.js"></script>
<script src="static/iframe/bootstrap-table/src/extensions/export/bootstrap-table-export.js"></script>
</body>
</html>