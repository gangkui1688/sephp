<div style="height:50px"></div>
<nav class="mui-bar mui-bar-tab">
    <div class="t-line">
        <a href="index.html" class="aui-tab-item mui-active">
            <span class="mui-icon mui-icon-home"></span>
            <span class="mui-tab-label">首页</span>
        </a>
        <a href="category.html" class="aui-tab-item" >
            <span class="mui-icon mui-icon-extra mui-icon-extra-class"></span>
            <span class="mui-tab-label">分类</span>
        </a>
        <a class="aui-tab-item" href="car.html">
            <span class="mui-icon mui-icon-extra mui-icon-extra-cart"></span>
            <span class="mui-tab-label">购物车</span>
        </a>
        <a class="aui-tab-item" href="me.html">
            <span class="mui-icon mui-icon-extra mui-icon-extra-people"></span>
            <span class="mui-tab-label">我的</span>
        </a>
    </div>

</nav>
<script src="js/mui.min.js"></script>
<script type="text/javascript" charset="utf-8">
    mui.init({
        swipeBack:true //启用右滑关闭功能
    });
    var slider = mui("#slider");
    document.getElementById("switch").addEventListener('toggle', function(e) {
        if (e.detail.isActive) {
            slider.slider({
                interval: 5000
            });
        } else {
            slider.slider({
                interval: 0
            });
        }
    });
</script>
<script>
    mui.init();
</script>


</body>
</html>
