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
                        <div class="form-group">
                            <label class="col-sm-3 control-label">名 称：</label>
                            <div class="col-sm-4">
                                <input  name="name" class="form-control" value="<{request_em array=$data key='name'}>" required class="valid">
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
                            <label class="col-sm-2 control-label">库 存：</label>
                            <div class="col-sm-3">
                                <input type="number" name="store" class="form-control" value="<{request_em array=$data key='store'}>" required class="valid">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label"> 成本价：</label>
                            <div class="col-sm-3">
                                <input  name="cost" class="form-control" value="<{request_em array=$data key='cost'}>" required class="valid">
                            </div>
                            <label class="col-sm-2 control-label">市场价：</label>
                            <div class="col-sm-3">
                                <input name="mktprice" class="form-control" value="<{request_em array=$data key='mktprice'}>" required class="valid">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label"> 成本价：</label>
                            <div class="col-sm-3">
                                <input  name="cost" class="form-control" value="<{request_em array=$data key='cost'}>" required class="valid">
                            </div>
                            <label class="col-sm-2 control-label">市场价：</label>
                            <div class="col-sm-3">
                                <input name="mktprice" class="form-control" value="<{request_em array=$data key='mktprice'}>" required class="valid">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">标题简介：</label>
                            <div class="col-sm-4">
                                <input id="input_url" name="brief" class="form-control" value="<{request_em  array=$data key='brief' }>" required class="error">
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
                                <input type="radio" name="disabled" <{if !empty($data.disabled) && $data.disabled ==1 }>selected<{/if}> value="1" /> 启用
                                <input type="radio" name="disabled" <{if !empty($data.disabled) && $data.disabled ==2 }>selected<{/if}> value="2" /> 禁用
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">排序：</label>
                            <div class="col-sm-8">
                                <input id="input_order_num" name="ordernum" value="<{request_em array=$data key='ordernum' }>" class="form-control" type="text"  />
                            </div>
                        </div>

                         <div class="hr-line-dashed"></div>

                        <div class="form-group uploader-group uploader-group-img"
                        data-compress="false"
                        data-thumb_w=''
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
                                <div class="uploader-list">

                                    <{if !empty($data['brand_logo'])}>
                                        <div id="WU_FILE_0" class="item img-item pull-left" style="margin-bottom:10px;margin-right:10px;"><img style="width:100px;height:100px;" src="http://sephp.a.com/upload/image/32/2ccbdc5c06dd8e7e147a7a5fbbc2a0e8.jpg"><i class="fa fa-close close-btn"></i><div class="progress progress-striped active" style="display: none;"><div class="progress-bar" role="progressbar" style="width: 100%;"></div></div><input type="hidden" value="32/2ccbdc5c06dd8e7e147a7a5fbbc2a0e8.jpg" name="brand_logo[]" class="hid-filename "></div>
                                    <{/if}>

                                </div>
                                <a <{if !empty($data['brand_logo'])}>style="display:none;"<{/if}> class="btn btn-dark uploader-picker" data-file="brand_logo" data-type="image">
                                    <i class="fa fa-upload"></i>
                                </a>
                            </div>
                            <div class="hidden-input col-sm-9 col-sm-offset-2">
                                <input type="hidden" class="form-control file" datatype="file" nullmsg="请上传文件">
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

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
