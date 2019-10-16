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
                        <input name="brand_id" type="hidden" value="<{request_em array=$data key='brand_id' }>" />
                        <div class="form-group">
                            <label class="col-sm-3 control-label">名 称：</label>
                            <div class="col-sm-4">
                                <input  name="brand_name" class="form-control" value="<{request_em array=$data key='brand_name'}>" required class="valid">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">URL：</label>
                            <div class="col-sm-4">
                                <input id="input_url" name="brand_url" class="form-control" value="<{request_em  array=$data key='brand_url' }>" required class="error">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">关键字：</label>
                            <div class="col-sm-8">
                                <input id="input_keywords" name="brand_keywords" class="form-control" value="<{request_em  array=$data key='brand_keywords'}>" required class="error">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">状 态：</label>
                            <div class="col-sm-8">
                                <input type="radio" name="disabled" value="1" /> 启用
                                <input type="radio" name="disabled" value="2" /> 禁用
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">排序：</label>
                            <div class="col-sm-8">
                                <input id="input_order_num" name="order_num" class="form-control" type="text"  />
                            </div>
                        </div>

                         <div class="hr-line-dashed"></div>

                        <div class="form-group uploader-group uploader-group-img"
                        data-compress="false"
                        data-thumb_w='100'
                        data-auto="true"
                        data-len="1"
                        data-size="50"
                        data-multiple="false"
                        data-dir="image"
                        data-extensions="gif,jpg,jpeg,bmp,png"
                        data-chunked="chunked">
                            <label class="col-sm-3 control-label"> 单图:</label>
                            <div class="col-sm-8">
                                <!--用来存放文件信息-->
                                <div class="uploader-list"></div>
                                <a class="btn btn-dark uploader-picker" data-file="image" data-type="image"><i class="fa fa-upload"></i> </a>
                            </div>
                            <div class="hidden-input col-sm-9 col-sm-offset-2">
                                <input type="hidden" class="form-control file" datatype="file" nullmsg="请上传文件">
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group uploader-group uploader-group-img"
                        data-auto="true"
                        data-dir="image"
                        data-height="1026"
                        data-width="1624"
                        data-extensions="gif,jpg,jpeg,bmp,png">
                            <label class="col-sm-3 control-label">多图:</label>
                            <div class="col-sm-8">
                                <div class="uploader-list"></div>
                                <a class="btn btn-dark uploader-picker" data-file="images" data-type="image"><i class="fa fa-upload"></i> </a>
                            </div>
                            <div class="hidden-input col-sm-9 col-sm-offset-2">
                                <input type="hidden" class="form-control file" datatype="file" nullmsg="请上传文件">
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">


                            <label class="col-sm-3 control-label">LOGO：</label>
                            <div class="col-sm-8">
                                <input id="input_logo" name="brand_logo" class="form-control" type="text" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">描述：</label>
                            <div class="col-sm-8">
                                <textarea  name="brand_desc" rows="10" class="form-control"><{request_em  array=$data key='brand_desc' }></textarea>
                            </div>
                        </div>
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
