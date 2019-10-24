<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - 登录超时</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="static/frame/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <link href="static/frame/css/animate.min.css" rel="stylesheet">
    <link href="static/frame/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>

</head>

<body class="gray-bg">

<div class="lock-word animated fadeInDown">
</div>
<div class="middle-box text-center lockscreen animated fadeInDown">
    <div>
        <div class="m-b-md">
            <img alt="image" class="img-circle circle-border" src="static/frame/img/a1.jpg">
        </div>
        <h3>Beaut-zihan</h3>
        <p>您需要再次输入密码</p>
        <form class="m-t" role="form" action="<{$_self_url}>">
            <div class="form-group">
                <input type="password" class="form-control" placeholder="******" required="">
            </div>
            <button type="submit" class="btn btn-primary block full-width">登录到H+</button>
        </form>
    </div>
</div>
<script src="static/frame/js/jquery.min.js?v=2.1.4"></script>
<script src="static/frame/js/bootstrap.min.js?v=3.3.5"></script>

</body>

</html>