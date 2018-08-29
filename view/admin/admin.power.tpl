<{include file="public/header.tpl"}>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>编辑【<{$data.name}>】权限 <small></small></h5>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal m-t validate" method="post" action="<{$_self_url}>" id="signupForm" >

                        <{foreach from=$powers item="p" }>
                        <div class="form-group radio">
                            <label class="col-sm-2 control-label">
                                <{$p.title}><input class="<{$p.title}>" id="<{$p.title}>" style="margin-left:6px;margin-top: 2px;" type="checkbox" >:
                            </label>

                            <div class="col-sm-10">
                                <{foreach from=$p.menu item=p_second}>
                                    <label class="checkbox-inline i-checks">
                                        <input style="margin-top: 2px;" id="<{$p_second.title}>" class="<{$p.title}> <{$p_second.title}>" type="checkbox" name="power[]" value="<{$p_second.href}>"><{$p_second.title}> :
                                    </label>
                                    <{if isset($p_second.menu)}>
                                        <{foreach from=$p_second.menu item=p_thread}>
                                        <label class="checkbox-inline i-checks">
                                            <input style="margin-top: 2px;" class="<{$p.title}> <{$p_second.title}>" type="checkbox" name="power[]" value="<{$p_thread.href}>"><{$p_thread.title}>
                                        </label>
                                        <{/foreach}>
                                    <{/if}>
                                    <div class="hr-line-dashed"></div>
                                <{foreachelse}>
                                <{/foreach}>
                            </div>

                        </div>
                        <div class="hr-line-dashed"></div>
                        <{/foreach}>

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
<script>
    $(function () {
        $('input').on('click',function () {
            var id = $(this).attr('id');
            console.log(id,$(this).prop('checked'));
            if(id != undefined && $(this).prop('checked') === true){
                $('.'+id).attr('checked',false);
            }else if(id != undefined){
                $('.'+id).attr('checked',true);
            }
        })
    })
</script>