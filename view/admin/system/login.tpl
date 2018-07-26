<!DOCTYPE html>
<html class="loginHtml">
<head>
    <meta charset="utf-8">
    <title>登录2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="static/iframe/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="static/iframe/css/public.css" media="all" />
</head>
<body class="loginBody">
<form class="layui-form">
    <div class="login_face"><img src="static/iframe/images/face.jpg" class="userAvatar"></div>
    <div class="layui-form-item input-item">
        <label for="userName">用户名</label>
        <input type="text" name="username" placeholder="请输入用户名" autocomplete="off" id="userName" class="layui-input" lay-verify="required">
    </div>
    <div class="layui-form-item input-item">
        <label for="password">密码</label>
        <input type="password" name="password" placeholder="请输入密码" autocomplete="off" id="password" class="layui-input" lay-verify="required">
    </div>
    <div class="layui-form-item input-item" id="imgCode">
        <label for="code">验证码</label>
        <input type="text" name="verify" placeholder="请输入验证码" autocomplete="off" id="code" class="layui-input">
        <img id="img-verify" src="?ct=public&ac=verify" onclick="this.src='?ct=public&ac=verify&time='+Math.random();">
    </div>
    <div class="layui-form-item">
        <button class="layui-btn layui-block" lay-filter="login" lay-submit>登录</button>
    </div>
    <div class="layui-form-item layui-row">
        <a href="javascript:;" class="seraph icon-qq layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
        <a href="javascript:;" class="seraph icon-wechat layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
        <a href="javascript:;" class="seraph icon-sina layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
    </div>
</form>
<script type="text/javascript" src="static/iframe/layui/layui.js"></script>
<script type="text/javascript" src="static/iframe/js/login.js"></script>
<script type="text/javascript" src="static/iframe/js/cache.js"></script>
</body>
</html>