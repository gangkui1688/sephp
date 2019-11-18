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
                        <div class="form-group">
                            <label class="col-sm-3 control-label">卡劵前缀名称：</label>
                            <div class="col-sm-8">
                                <input type="text"  name="cpns_prefix" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">卡劵数量：</label>
                            <div class="col-sm-3">
                                <input type="number" name="number" class="form-control" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" >有 效 期：</label>
                            <div class="col-sm-3 input-group">
                                <input type="number" name="expre_time" class="form-control" value="" required />
                                <div class="input-group-addon">天</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">卡劵类型：</label>
                            <div class="col-sm-3">
                                <select name="cpns_type" class="form-control">
                                    <option value="1">充值卡</option>
                                    <option value="2">月卡</option>
                                    <option value="3">年卡</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group" id="cpns_limit-form-grounp">
                            <label class="col-sm-3 control-label">充值金额：</label>
                            <div class="col-sm-3">
                                <input type="number" name="cpns_limit" min="0" max="999999" class="form-control" required />
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
<script>
    $(function () {
        $('select[name="cpns_type"]').change(function () {
            if($(this).val() != 1){
                $('#cpns_limit-form-grounp').hide();
            }else{
                $('#cpns_limit-form-grounp').show();
            }
        })
    })
</script>