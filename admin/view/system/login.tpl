<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - 登录</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="static/frame/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="static/frame/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <link href="static/frame/css/animate.min.css" rel="stylesheet">
    <link href="static/frame/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name"><i class="fa fa-windows"></i></h1>

        </div>
        <!--h3>欢迎使用 H+</h3-->

        <form class="m-t" method="post" target="_self"  role="form" action="<{$_self_url}>">

                <div class="form-group">
                    <input type="text" class="form-control" name="username" placeholder="用户名" required="" />
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="密码" required="" />
                </div>

            <{if !empty($verify_url)}>
                <div class="form-group">
                    <img style="width:100%;max-height: 38px;" src="<{$verify_url}>" onclick="this.src=this.src + '&time=' + Math.random()" />
                </div>

                <div class="form-group">
                    <input type="text" name="verify" class="form-control" placeholder="验证码" required="" />
                </div>
            <{/if}>


            <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>

            <!--p class="text-muted text-center"> <a href="login.html#"><small>忘记密码了？</small></a> | <a href="register.html">注册一个新账号</a>
            </p-->

        </form>
    </div>
</div>
<script src="static/frame/js/jquery.min.js?v=2.1.4"></script>
<script src="static/frame/js/bootstrap.min.js?v=3.3.5"></script>

</body>

</html>
