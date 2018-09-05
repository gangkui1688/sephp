<{include file="public/header.tpl"}>

<link rel="stylesheet" type="text/css" href="static/frame/css/plugins/webuploader/webuploader.css">
<link rel="stylesheet" type="text/css" href="static/frame/css/demo/webuploader-demo.min.css">
<div class="wrapper wrapper-content animated fadeIn">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>百度Web Uploader</h5>
                    <div class="ibox-tools">

                    </div>
                </div>
                <div class="ibox-content">
                    <div class="page-container">
                        <p>您可以尝试文件拖拽，使用QQ截屏工具，然后激活窗口后粘贴，或者点击添加图片按钮，来体验此demo.</p>
                        <div id="uploader" class="wu-example">
                            <div class="queueList">
                                <div id="dndArea" class="placeholder">
                                    <div id="filePicker"></div>
                                    <p>或将照片拖到这里，单次最多可选300张</p>
                                </div>
                            </div>
                            <div class="statusBar" style="display:none;">
                                <div class="progress">
                                    <span class="text">0%</span>
                                    <span class="percentage"></span>
                                </div>
                                <div class="info"></div>
                                <div class="btns">
                                    <div id="filePicker2"></div>
                                    <div class="uploadBtn">开始上传</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<{include file="public/footer.tpl" }>
<script type="text/javascript">
    ;
</script>
<script src="static/frame/js/plugins/webuploader/webuploader.min.js"></script>
<script src="static/frame/js/demo/webuploader-demo.min.js"></script>