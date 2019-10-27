<{include file="public/header.tpl"}>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>验票app设置</h5>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal m-t validate" method="post" action="<{$_self_url}>" id="signupForm">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">APP TOKEN：</label>
                            <div class="col-sm-4">
                                <input type="text" readonly name="app_token" class="form-control" value="<{request_em array=$data key=app_token}>" required class="valid">
                            </div>
                            <div class="col-sm-4">
                                <a href="javascript:create_token();" class="btn btn-success btn-sm">随机生成</a>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">APP接口地址：</label>
                            <div class="col-sm-4">
                                <input type="text" name="app_url" class="form-control" value="<{request_em array=$data key=app_url}>" required  class="valid">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">选择核销管理员：</label>
                            <div class="col-sm-2">
                                <select class="form-control" name="uid" >
                                    <option value="0"> ---请选择--- </option>
                                    <{foreach from=$userlist item=user}>
                                        <option <{if $user.admin_id == $data.uid}>selected<{/if}> value="<{$user.admin_id}>"><{$user.username}></option>
                                    <{/foreach}>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-8 col-sm-offset-3">
                                <button class="btn btn-primary" type="submit">保存</button>
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
    function create_token()
    {
        len = 32;
    　　 var $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    　　 var maxPos = $chars.length;
    　　 var pwd = '';
    　　 for (i = 0; i < len; i++) {
    　　　　pwd += $chars.charAt(Math.floor(Math.random() * (maxPos+1)));
     　　}
        $('input[name="app_token"]').val(pwd);

    }
</script>