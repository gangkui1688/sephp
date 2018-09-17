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
                    <h5>添加文章</h5>
                </div>
                <div class="ibox-content">

                    <div class="tabs-container">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true"> 通用信息</a></li>
                            <li class=""><a data-toggle="tab" href="#tab-2" aria-expanded="false">文章内容</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="tab-1" class="tab-pane active">
                                <div class="panel-body">
                                    <form class="form-horizontal m-t validate" method="post" action="<{$_self_url}>" id="signupForm">
                                        <input name="<{$pk}>" type="hidden" value="<{if isset($data)}><{$data.cate_id}><{else}>0<{/if}>">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">文章标题：</label>
                                            <div class="col-sm-8">
                                                <input type="text" name="title" class="form-control" value="<{if isset($data)}><{$data.title}><{/if}>" required class="valid">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">文章分类：</label>
                                            <div class="col-sm-8">
                                                <select name="cate_id" class="form-control" <{if isset($data)}>disabled<{/if}> >
                                                 <option value="0">---请选择文章分类---</option>
                                                <{foreach from=$cates item=cate }>
                                                     <option value="<{$cate.cate_id}>" <{if isset($data) && $data.cate_id == $cate.cate_id}>selected<{/if}> >
                                                     <{for $var=2 to $cate.level }>&nbsp;&nbsp;&nbsp;&nbsp;<{/for}><{$cate.name}>
                                                    </option>
                                                <{/foreach}>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">文章重要性：</label>
                                            <div class="col-sm-4">
                                                <input type="radio" value="2" <{if isset($data) && $data.is_top == 2}>checked<{/if}> name="is_top" required /> 普通
                                            </div>
                                            <div class="col-sm-4 ">
                                                <input type="radio" value="1" <{if !isset($data) || $data.is_top != 2}>checked<{/if}> name="is_top" required /> 置顶
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">是否显示：</label>
                                            <div class="col-sm-4">
                                                <input type="radio" value="2" <{if isset($data) && $data.is_show == 2}>checked<{/if}> name="is_show" required /> 不显示
                                            </div>
                                            <div class="col-sm-4 ">
                                                <input type="radio" value="1" <{if !isset($data) || $data.is_show != 2}>checked<{/if}> name="is_show" required /> 显示
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label"> 文章作者：</label>
                                            <div class="col-sm-4">
                                                <input type="username" name="author" class="form-control" value="<{if isset($data)}><{$data.author}><{/if}>"  class="valid">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">关键字：</label>
                                            <div class="col-sm-8">
                                                <textarea  name="keywords" class="form-control"><{if isset($data)}><{$data.keywords}><{/if}></textarea>
                                                <span class="help-block m-b-none"><i class="fa fa-info-circle"></i>关键字为选填项，其目的在于方便外部搜索引擎搜索</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">描述：</label>
                                            <div class="col-sm-8">
                                                <textarea  name="description" class="form-control"><{if isset($data)}><{$data.description}><{/if}></textarea>
                                                <span class="help-block m-b-none"><i class="fa fa-info-circle"></i>描述选填项，其目的在于方便外部搜索引擎搜索</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label"> 外部链接：</label>
                                            <div class="col-sm-4">
                                                <input type="username" name="url" class="form-control" value="<{if isset($data)}><{$data.url}><{/if}>" class="valid">
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

                            <div id="tab-2" class="tab-pane">
                                <div class="panel-body">
                                    <form class="form-horizontal m-t validate" method="post" action="<{$_self_url}>" id="signupForm">
                                        <input name="<{$pk}>" type="hidden" value="<{if isset($data)}><{$data.cate_id}><{else}>0<{/if}>">
                                        
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <div id="summernote"><p>Hello Summernote</p></div>
                                            </div>
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
            </div>
        </div>
    </div>
</div>
<{include file="public/footer.tpl"}>

<link href="static/frame/css/plugins/summernote/summernote.css" rel="stylesheet" />
<script src="static/frame/js/plugins/summernote/summernote.js"></script>
<script src="static/frame/js/plugins/summernote/summernote-zh-CN.js"></script>


<script>
    $(document).ready(function() {
        $('#summernote').summernote({
            lang: 'zh-CN',
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true                  // set focus to editable area after
        });
    });
</script>