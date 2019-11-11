<{include file="./public/header.tpl"}>


<div class="mui-content" style="background:#fff">
    <div id="slider" class="mui-slider" >
        <div class="mui-slider-group">
            <div class="mui-slider-item">
                <a href="page.html#">
                    <img src="static/images/page.jpg">
                </a>
            </div>
            <div class="mui-slider-item">
                <a href="page.html#">
                    <img src="static/images/page1.jpg">
                </a>
            </div>
        </div>
        <div class="mui-slider-indicator">
            <div class="mui-indicator mui-active"></div>
            <div class="mui-indicator"></div>
        </div>
    </div>
    <div class="aui-title-h b-line">
        <h3>2017春装新款修身九分西装裤小脚高腰休闲西裤女装,修身九分西装裤小  </h3>
        <p>修身九分西装裤小脚高腰休闲西裤女装anna家32176</p>
        <em>¥81.25</em>
        <i>价格 ¥121.25</i>
        <div class="aui-title-sp "><span class="mui-icon-extra mui-icon-extra-heart">销量 34</span>  <span class="mui-icon-extra mui-icon-extra-heart">收藏475人</span>  <span class="mui-icon-extra mui-icon-extra-heart">顺丰快递</span>  </div>
    </div>
    <div class="devider b-line"></div>
    <div class="">
        <div style="padding:0 10px; margin-top:10px"class="">
            <div id="segmentedControl" class="mui-segmented-control mui-segmented-control-inverted mui-segmented-control-primary">
                <a class="mui-control-item mui-active" href="page.html#item1">商品详情</a>
            </div>
        </div>
        <div>
            <div id="item1" class="mui-control-content mui-active" style="height:1200px">
                <{$data.brief}>
            </div>

        </div>
    </div>
    <script>
        window.onready = function()
        {
            mui.init({
                swipeBack: true //启用右滑关闭功能
            });

            (function($) {
                $('#scroll').scroll({
                    indicators: true //是否显示滚动条
                });
                var segmentedControl = document.getElementById('segmentedControl');
                $('.mui-input-group').on('change', 'input', function() {
                    if (this.checked) {
                        var styleEl = document.querySelector('input[name="style"]:checked');
                        var colorEl = document.querySelector('input[name="color"]:checked');
                        if (styleEl && colorEl) {
                            var style = styleEl.value;
                            var color = colorEl.value;
                            segmentedControl.className = 'mui-segmented-control' + (style ? (' mui-segmented-control-' + style) : '') + ' mui-segmented-control-' + color;
                        }
                    }
                });
            })(mui);

        }

    </script>


    <div style="height:900px"></div>
</div>



<div style="height:50px"></div>
<nav class="mui-bar mui-bar-tab">
    <div class="t-line aui-on-cell">
        <div class="aui-ons">
            <a href="page.html#"><span class="mui-icon-extra mui-icon-extra-addpeople"></span><i>客服</i></a>
            <a href="page.html#"><span class="mui-icon-extra mui-icon-extra-university"></span><i>店铺</i></a>
            <a href="page.html#"><span class="mui-icon-extra mui-icon-extra-heart-filled"></span><i>收藏</i></a>
        </div>
        <div class="aui-onc">
            <a href="page.html#" style="margin-right:-4px">加入购物车</a>
            <a href="order.html" class="aui-got">立即购买</a>
        </div>
    </div>
</nav>



<{include file="./public/footer.tpl"}>

<script type="text/javascript">

    function myform()
    {
        document.getElementById('myform').submit();
    }
</script>

<script type="text/javascript">
    window.onready = function(){

        mui.init({
            swipeBack: true //启用右滑关闭功能
        });
        var slider = document.getElementById("slider");
        mui('.mui-input-group').on('change', 'input', function() {
            if (this.checked) {
                switch (this.value) {
                    case 'static':
                        document.getElementById("img1").className = "";
                        document.getElementById("slider").classList.add("mui-hidden");
                        break;
                    case 'slider':
                        document.getElementById("img1").className = "mui-hidden";
                        if(slider.classList.contains("mui-hidden")){
                            document.getElementById("slider").classList.remove("mui-hidden");
                        }
                        break;
                }
            }
        });

    }
</script>
