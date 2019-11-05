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
                                <th>订单编号</th>
                                <th>创建时间</th>
                                <th>订单附言</th>
                                <th>用户</th>
                                <th>手机号码</th>
                                <th>订单总价</th>
                                <th>折扣减免</th>
                                <th>商品优惠</th>
                                <th>订单优惠</th>
                                <th>币种</th>
                                <th>支付金额</th>
                                <th>状态</th>
                                <th>支付状态</th>
                                <th>操作</th>
                            </tr>

                            <{foreach from=$list item=data }>
                            <tr>
                                <td> <{$data.order_sn}> </td>
                                <td> <{$data.show_addtime}> </td>
                                <td> <{$data.memo}> </td>
                                <td> <{$data.member_name}> </td>
                                <td> <{$data.mobile}> </td>
                                <td> <{$data.total_amount}> </td>
                                <td> <{$data.discount}> </td>
                                <td> <{$data.pmt_goods}> </td>
                                <td> <{$data.pmt_order}> </td>
                                <td> <{$data.currency}> </td>
                                <td> <{$data.payed}> </td>
                                <td> <{$data.show_status}> </td>
                                <td> <{$data.show_pay_status}> </td>
                                <td>
                                    <a class="btn btn-xs btn-danger" href="<{$edit_url}><{$data.order_id}>">编辑</a>
                                </td>
                            </tr>
                            <{foreachelse}>

                            <{/foreach}>

                            <tr >
                                <td class="text-right" colspan="15"><{$pages}></td>
                            </tr>
                        </table>
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>
<{include file="public/footer.tpl"}>
