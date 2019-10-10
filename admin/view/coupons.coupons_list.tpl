<{include file="public/header.tpl"}>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>用户列表</h5>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-sm-1 m-b-xs">
                            <a class="btn btn-primary btn-sm" href="<{$add_url}>">添加</a>
                        </div>
                        <form action="<{$_self_url}>" method="get" target="_self" class="form-horizontal" >
                            <input type="hidden" name="ct" value="<{$_ct_name}>" />
                            <input type="hidden" name="ac" value="<{$_ac_name}>" />
                            <div class="col-sm-2 m-b-xs">
                                <select name="cpns_status" class="input-sm form-control input-s-sm inline">
                                    <option value="" >状态</option>
                                    <option value="1" <{if $cpns_status == 1}>selected<{/if}> >未使用</option>
                                    <option value="2" <{if $cpns_status == 2}>selected<{/if}> >已使用</option>
                                </select>
                            </div>
                            <div class="col-sm-3">
                                <div class="input-group">
                                    <input type="text" placeholder="请输入搜索关键词" name="keywords" class="input-sm form-control" value="<{$keywords}>" />
                                    <span class="input-group-btn">
                                                <input type="submit" class="btn btn-sm btn-primary" value="搜索" />
                                        </span>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <tr>
                                <th>前缀</th>
                                <th>优惠码</th>
                                <th>状态</th>
                                <th>卡券额度</th>
                                <th>添加日期</th>
                                <th>过期时间</th>
                                <th>操作</th>
                            </tr>

                            <{foreach from=$list item=data }>
                            <tr>
                                <td> <{$data.cpns_prefix}> </td>
                                <td><span class="pie"> <{$data.cpns_code}></span></td>
                                <td> <{if $data.cpns_status == 1}>未使用<{else}>已使用<{/if}> </td>
                                <td> <{$data.cpns_limit}> </td>
                                <td> <{$data.create_time|date_format:'%Y-%m-%d'}> </td>
                                <td> <{if $data.expire_time == 0}>永久<{else}><{$data.expire_time|date_format:'%Y-%m-%d H%:M%:S%'}><{/if}> </td>
                                <td>
                                    <!--a class="btn btn-xs btn-success" href="<{$d_url}>&id=<{$data.id}>">删除</a-->
                                </td>
                            </tr>
                            <{foreachelse}>

                            <{/foreach}>

                            <tr>
                                <td class="text-right" colspan="7">
                                    <{$pages}>
                                </td>
                            </tr>
                        </table>
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>
<{include file="public/footer.tpl"}>
<script>
    $(function () {
        $('form').submit(function () {
            //return  false;
        });
    })

</script>