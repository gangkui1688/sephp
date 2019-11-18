<{include file="public/header.tpl"}>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>列表</h5>
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
                                <th>编号</th>
                                <th>名称</th>
                                <th>上/下架</th>
                                <th>库存</th>
                                <th>浏览数</th>
                                <th>购买数</th>
                                <th>销售价格</th>
                                <th>成本价</th>
                                <th>市场价</th>
                                <th>添加时间</th>
                                <th>操作</th>
                            </tr>

                            <{foreach from=$list item=data }>
                            <tr>
                                <td> <{$data.goods_sn}> </td>
                                <td> <{$data.name}> </td>
                                <td> <{$data.show_marketable}> </td>
                                <td> <{$data.store}> </td>
                                <td> <{$data.view_count}> </td>
                                <td> <{$data.buy_count}> </td>
                                <td> <{$data.price}> </td>
                                <td> <{$data.cost}> </td>
                                <td> <{$data.mktprice}> </td>
                                <td> <{$data.addtime|date_format:'%Y-%m-%d'}> </td>
                                <td>
                                    <a class="btn btn-xs btn-danger" href="<{$edit_url}><{$data.goods_id}>">编辑</a>
                                </td>
                            </tr>
                            <{foreachelse}>

                            <{/foreach}>

                            <tr >
                                <td class="text-right" colspan="11"><{$pages}></td>
                            </tr>
                        </table>
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>
<{include file="public/footer.tpl"}>
