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
                                <div class="col-sm-2 m-b-xs">
                                    <select name="status" class="input-sm form-control input-s-sm inline">
                                        <option value="">状态</option>
                                        <option value="1">已启用</option>
                                        <option value="2">已禁用</option>
                                    </select>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <input type="text" placeholder="请输入搜索关键词" name="keywords" class="input-sm form-control" value="" />
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
                                <th>ID</th>
                                <th>登录名称</th>
                                <th>真实名称</th>
                                <th>状态</th>
                                <th>备注</th>
                                <th>操作</th>
                            </tr>

                            <{foreach from=$list item=data }>
                            <tr>
                                <td> <{$data.admin_id}> </td>
                                <td> <{$data.username}> </td>
                                <td><span class="pie"> <{$data.realname}></span></td>
                                <td> <{if $data.status == 1}>已启用<{else}>已禁用<{/if}> </td>
                                <td> <{$data.realname}> </td>
                                <td>
                                        <{if $data.status == 1}>
                                            <a class="btn btn-xs btn-danger" href="<{$save_url}>&admin_id=<{$data.admin_id}>&status=2">
                                                禁用
                                            </a>
                                        <{else}>
                                            <a class="btn btn-xs btn-primary" href="<{$save_url}>&admin_id=<{$data.admin_id}>&status=1">
                                                启用
                                            </a>
                                        <{/if}>
                                    <a class="btn btn-xs btn-success" href="<{$edit_url}>&admin_id=<{$data.admin_id}>">编辑</a>
                                </td>
                            </tr>
                            <{foreachelse}>

                            <{/foreach}>

                            <tr>
                                <td class="text-right" colspan="6">
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