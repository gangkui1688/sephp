<{include file="public/header.tpl"}>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>清除缓存</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <p>
                        <a type="button" class="btn btn-primary btn-sm" href="<{$clear_view_cache_url}>">清除模版缓存</a>
                        <a type="button" class="btn btn-primary btn-sm" href="<{$clear_static_page_url}>">清除静态页面</a>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>基础设置</h5>

                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <form action="<{$_self_url}>" method="post" class="form-horizontal">
                    <table class="table table-bordered layui-table-box table-mail table-responsive text-right">
                        <tr>
                            <th class="text-center col-sm-2">变量说明</th>
                            <th class="text-center">变 量 值</th>
                        </tr>
                        <tr>
                            <td>网站名称</td>
                            <td><input class="form-control" name="web_name" value="<{if isset($data.web_name)}><{$data.web_name}><{/if}>" /></td>
                        </tr>
                        <tr>
                            <td>网址标题</td>
                            <td><textarea class="form-control" name="page_title"><{if isset($data.page_title)}><{$data.page_title}><{/if}></textarea></td>
                        </tr>
                        <tr>
                            <td>网址关键字</td>
                            <td><textarea class="form-control" name="page_keywords"><{if isset($data.page_keywords)}><{$data.page_keywords}><{/if}></textarea></td>
                        </tr>
                        <tr>
                            <td>网址描述</td>
                            <td><textarea class="form-control" name="page_description"><{if isset($data.page_description)}><{$data.page_description}><{/if}></textarea></td>
                        </tr>
                        <tr>
                            <td>统计代码</td>
                            <td><textarea class="form-control" name="count_code"><{if isset($data.count_code)}><{$data.count_code}><{/if}></textarea></td>
                        </tr>
                        <tr>
                            <td>ICP备案证书号	</td>
                            <td><input class="form-control" name="icp_name" value="<{if isset($data.icp_name)}><{$data.icp_name}><{/if}>" /></td>
                        </tr>
                        <tr>
                            <td>公司地址</td>
                            <td><input class="form-control" name="company_address" value="<{if isset($data.company_address)}><{$data.company_address}><{/if}>" /></td>
                        </tr>
                        <tr>
                            <td>联系电话</td>
                            <td>
                                <input class="form-control" name="contact_number" value="<{if isset($data.contact_number)}><{$data.contact_number}><{/if}>" />
                                <span class="help-block m-b-none text-left" ><i class="fa fa-info-circle"></i> 多个号码用之间 @ 隔开</span>
                            </td>
                        </tr>
                        <tr>
                            <td>QQ号码</td>
                            <td>
                                <input class="form-control" name="qq_number" value="<{if isset($data.qq_number)}><{$data.qq_number}><{/if}>" />
                                <span class="help-block m-b-none text-left" ><i class="fa fa-info-circle"></i> 多个号码用之间 @ 隔开</span>
                            </td>
                        </tr>

                        <tr>
                            <td class="text-center" colspan="2"><button type="submit" class="btn btn-primary btn-sm">保存</button></td>
                        </tr>

                    </table>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
<{include file="public/footer.tpl"}>