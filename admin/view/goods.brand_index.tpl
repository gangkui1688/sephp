<{include file="public/header.tpl"}>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>品牌列表</h5>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-sm-1 m-b-xs">
                            <a class="btn btn-primary btn-sm" href="<{$add_url}>">添加</a>
                        </div>
                        <form action="<{$_self_url}>" method="get" class="form-horizontal" >
                            <input name="ac" type="hidden" value="<{$_ac_name}>" />
                            <input name="ct" type="hidden" value="<{$_ct_name}>" />
                            <div class="col-sm-2">
                                <div class="input-group">
                                    <input type="text" placeholder="请输入关键词" name="keywords" class="input-sm form-control" value="<{$keywords}>">
                                    <span class="input-group-btn">
                                            <button type="submit" class="btn btn-sm btn-primary"> 搜索</button>
                                    </span>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <tr>
                                <th>ID</th>
                                <th>名称</th>
                                <th>URL</th>
                                <th>LOG</th>
                                <th>描述</th>
                                <th>关键字</th>
                                <th>排序</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>

                            <{foreach from=$list item=data }>
                            <tr>
                                <td> <{$data.brand_id}> </td>
                                <td> <{$data.brand_name}> </td>
                                <td> <{$data.brand_logo}> </td>
                                <td> <{$data.brand_desc}> </td>
                                <td> <{$data.brand_keywords}> </td>
                                <td> <{$data.order_num}> </td>
                                <td> <{$data.show_disabled}> </td>
                                <td>
                                    <a class="btn btn-xs btn-danger" href="<{$edit_url}>&group_id=<{$data.group_id}>">启用/禁用</a>
                                    <a class="btn btn-xs btn-success" href="<{$power_edit_url}>&group_id=<{$data.group_id}>">编辑</a>
                                </td>
                            </tr>
                            <{foreachelse}>

                            <{/foreach}>

                        </table>
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>
<{include file="public/footer.tpl"}>
