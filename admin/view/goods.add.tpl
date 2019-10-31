<{include file="public/header.tpl"}>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">

                    <div class="ibox-tools back-url-class" >
                        <a class="" href="<{$back_url}>">
                            <i class="fa fa-chevron-left"></i>
                        </a>
                    </div>

                    <h5>添加</h5>

                </div>
                <div class="ibox-content">
                    <form class="form-horizontal m-t validate" method="post" action="<{$_self_url}>" id="signupForm">
                        <input name="goods_id" type="hidden" value="<{request_em array=$data key='goods_id' }>" />
                        <input name="goods_sn" type="hidden" value="<{request_em array=$data key='goods_sn' }>" />
                        <div class="form-group">
                            <label class="col-sm-3 control-label">名 称：</label>
                            <div class="col-sm-6">
                                <input  name="name" class="form-control" value="<{request_em array=$data key='name'}>" required class="valid">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">标题简介：</label>
                            <div class="col-sm-9">
                                <input id="input_url" name="brief" class="form-control" value="<{request_em  array=$data key='brief' }>" required class="error">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">上/下架：</label>
                            <div class="col-sm-3">
                                <select name="marketable" class="form-control">
                                    <option value="1">上架</option>>
                                    <option value="2">下架</option>>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label">库 存：</label>
                            <div class="col-sm-3">
                                <input type="number" name="store" class="form-control" value="<{request_em array=$data key='store'}>" required class="valid">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">无库存销售</label>
                            <div class="col-sm-3">
                                <select name="nostore_sell" class="form-control">
                                    <option value="1">是</option>>
                                    <option value="2">否</option>>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label">单 位：</label>
                            <div class="col-sm-3">
                                <input type="unit" name="unit" class="form-control" value="<{request_em array=$data key='unit'}>" required class="valid">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">销售价格</label>
                            <div class="col-sm-1">
                                <input  name="price" class="form-control" value="<{request_em array=$data key='price'}>" required class="valid">
                            </div><label class="col-sm-1 control-label">成本价：</label>
                            <div class="col-sm-2">
                                <input  name="cost" class="form-control" value="<{request_em array=$data key='cost'}>" required class="valid">
                            </div>
                            <label class="col-sm-1 control-label">市场价：</label>
                            <div class="col-sm-2">
                                <input name="mktprice" class="form-control" value="<{request_em array=$data key='mktprice'}>" required class="valid">
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label"> 购买数：</label>
                            <div class="col-sm-2">
                                <input  name="buy_count" class="form-control" value="<{request_em array=$data key='buy_count'}>" required class="valid">
                            </div>
                            <label class="col-sm-1 control-label"> 浏览数：</label>
                            <div class="col-sm-2">
                                <input name="view_count" class="form-control" value="<{request_em array=$data key='view_count'}>" required class="valid">
                            </div>
                            <label class="col-sm-1 control-label"> 评论数：</label>
                            <div class="col-sm-2">
                                <input name="comments_count" class="form-control" value="<{request_em array=$data key='comments_count'}>" required class="valid">
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-3 control-label">排序：</label>
                            <div class="col-sm-2">
                                <input type="number" id="input_order_num" name="p_order" value="<{request_em array=$data key='p_order' }>" class="form-control"   />
                            </div>

                            <label class="col-sm-1 control-label">积分：</label>
                            <div class="col-sm-2">
                                <input type="number" id="input_order_num" name="score" value="<{request_em array=$data key='score' }>" class="form-control"   />
                            </div>
                        </div>

                         <div class="hr-line-dashed"></div>

                        <div class="form-group uploader-group uploader-group-img"
                        data-compress="false"
                        data-thumb_w=''
                        data-auto="true"
                        data-size="50"
                        data-multiple="false"
                        data-dir="image"
                        data-extensions="gif,jpg,jpeg,bmp,png"
                        data-chunked="chunked">
                            <label class="col-sm-3 control-label"> 默认图片:</label>
                            <div class="col-sm-8">
                                <!--用来存放文件信息-->
                                <div class="uploader-list">
                                    <{if !empty($data.image_default_id)}>
                                    <{foreach from=$data.image_default_id item=img}>
                                        <div id="WU_FILE_0" class="item img-item pull-left" style="margin-bottom:10px;margin-right:10px;">
                                            <img style="width:100px;height:100px;" src="<{$img}>">
                                            <i class="fa fa-close close-btn"></i>
                                            <div class="progress progress-striped active" style="display: none;">
                                                <div class="progress-bar" role="progressbar" style="width: 100%;"></div>
                                            </div>
                                            <input type="hidden" value="<{$img}>" name="image_default_id[]" class="hid-filename ">
                                        </div>
                                    <{/foreach}>
                                    <{/if}>

                                </div>
                                <a class="btn btn-dark uploader-picker" data-file="image_default_id" data-type="image">
                                    <i class="fa fa-upload"></i>
                                </a>
                            </div>
                            <div class="hidden-input col-sm-9 col-sm-offset-2">
                                <input type="hidden" class="form-control file" datatype="file" nullmsg="请上传文件">
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">详细介绍：</label>
                            <div class="col-sm-9">
                                <div class="total-wrap" style="position: relative">
                                    <textarea id="redactor_content" name="intro" cols="30" rows="10" class="form-control"><{request_em  array=$data key='intro' }></textarea>
                                </div>

                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <div class="col-sm-8 col-sm-offset-3">
                                <button class="btn btn-primary" type="submit">提交</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<{include file="public/footer.tpl"}>

<script type="text/javascript">
        $(function()
        {
            $('#redactor_content').redactor({
                //imageGetJson: '?ct=upload&ac=redactor&type=file_manager_json',
                imageWebUpload: '?ct=upload&ac=upload',
                imageUpload: '?ct=upload&ac=upload_html5',
                imageDir: 'image',
                thumbWidth: 0,
                thumbHeight: 0,
                // videoGetJson: '?ct=upload&ac=redactor&type=file_manager_json',
                videoUpload: '?ct=upload&ac=upload_chunked',
                videoDir: 'video',
                plugins: [ 'fullscreen', 'webuploadImage', 'webuploadVideo', 'pasteImage', 'fontcolor'],
                minHeight: '480px',
                maxHeight: '480px',
                lang: 'zh_cn',
                imgFileNumLimit: 3,
                videoFileNumLimit: 3,
            });
        });
    </script>
