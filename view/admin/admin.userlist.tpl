<{include file="public/header.tpl" }>
    <style>
        div.container{width:100%;}

        #search-form .form-control{width:130px;display:initial;}
    </style>

<div class="wrapper wrapper-content animated fadeInRight">

        <div class="ibox-content">
            <div class="row row-lg">

                <div class="container" style="width: 100%">
                    <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group" style="float: left;margin-top: 10px;">
                        <form id="search-form" action="" method="GET" >
                        <a href="<{$addurl}>" class="btn btn-success btn-sm"><i class="glyphicon glyphicon-plus" ></i>添加</a>
                        <select  name="status" class="form-control">
                            <option value="">请选择</option>
                            <option value="1">启用</option>
                            <option value="2">禁用</option>
                        </select>
                        <select  name="sex" class="form-control">
                            <option value="">请选择</option>
                            <option value="1">启用</option>
                            <option value="2">禁用</option>
                        </select>
                        </form>
                    </div>

                    <table id="tableList"></table>
                </div>

            </div>
        </div>

    </div>
</div>
<{include file="public/footer.tpl" }>

<script >
    var tableList = $('#tableList');
    $(function () {

        tableList.bootstrapTable({
            url: "<{$get_json_list}>",
            refresh: {
                url: '<{$get_json_list}>',
                silent: false,
                //pageSize:2,
                query:{foo: 'bar'},
            },
            dataType:'json',
            method: 'post',
            paginationDetailHAlign: 'left',
            contentType: "application/x-www-form-urlencoded",//post请求必带属性
            formatLoadingMessage:function () {
                return '数据加载中，请稍后。。。';
            },
            formatRefresh: function () {
                return '刷新';
            },
            //sortClass: 'admin_id',
            cache:true,
            showRefresh: true,
            showToggle: true,
            showFullscreen: true,
            showPaginationSwitch: true,//显示分页按钮开关
            buttonsAlign: 'right',
            toolbarAlign: 'left',
            showHeader: true,
            showFooter: false,
            showColumns: true,
            //cardView: true,
            detailView: true,//显示列表详情
            detailFormatter:function () {
                return 'fasdfasdfasdfa';
            },
            sortStable: true,

            formatShowingRows: function (pageFrom, pageTo, totalRows) {
                //console.log(pageFrom,pageTo,totalRows);
                //显示第 '+ pageFrom +' 到第 '+ pageTo +' 条，总
                return ' 共' + totalRows + ' 条';
            },
            formatRecordsPerPage: function (pageNumber) {
                return '每页显示 ' + pageNumber + ' 条'; ;
            },
            paginationPreText: ' < ',
            paginationNextText: '下一页',
            iconSize: 'outline',
            idField:'admin_id',
            pagination: true, //分页
            dataField: 'rows',
            //pageNumber: '2',//初始化到第几页
            pageSize: 10,//初始化页面条数
            pageList:[5,10,25,20,50],
            singleSelect: false,
            //data-locale: 'zh-US',
            search: true, //显示搜索框
            customSearch: function (text) {
                console.log(text);
                return '123123';
            },
            formatSearch: function (){
                return '请输入用户名';
            },
            showSearchButton: true,
            searchOnEnterKey: true,
            strictSearch: true,
            trimOnSearch: true, //True to trim spaces in search field.
            searchText: '',
            searchAlign: 'left',
            
            maintainSelected: false,
            sidePagination: "server", //server 服务端处理分页
            columns: [{
                field: 'checkbox',
                title: '全选',
                checkbox: true
            },{
                field: 'admin_id',
                title: 'ID',
                sortable: true,
                order:'desc',
                visible:true, //影藏该字段
            }, {
                field: 'username',
                align: 'center',
                title: '登录名',
            },{
                field: 'status',
                align: 'center',
                title: '状态',
                editable: {
                    type: 'select',
                    title: '修改状态',
                    source:[
                        {value:'0',text:'禁用'},
                        {value:'1',text:'启用'}
                    ],
                    validate: function (value) {
                        console.log(this);
                        editFields(1,'status',value);
                        return '';
                    }
                }
            },{
                field: 'nickname',
                title: '昵称',
                align: 'center',
                editable: {
                    type: 'text',
                    empty: 'ssdfasdfads',
                    title: '修改昵称',
                    validate: function (value) {
                        var data = $table.bootstrapTable('getData'),
                            index = $(this).parents('tr').data('index');
                        console.log(data[index]);
                        return '';
                    }
                },
                formatter: function (value,row,index) {
                    return row.author_name;
                },
                events: function(e){
                    alert(e);
                }
            },{
                field: 'email',
                title: '邮箱',
                formatter: function (value,row,index) {
                    return value;
                }
            },{
                field: 'create_time',
                title: '添加时间',
                sortable: true,
                clickToSelect: false,
                switchable: false,
                align: 'center',
                valign: 'middle',
                formatter: function (value) {
                    if(value == null){
                        return '';
                    }
                    return new Date(parseInt(value) * 1000).toLocaleString().substr(0,10).replace(/\//g, "-");
                    //return year+'-'+month+'-'+date;
                }
            },{
                field: 'operate',
                title: '操作',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row,index) {
                    return [
                        '<a class="btn btn-xs btn-primary" href="javascript:editBook(0)" title="Like">',
                        '<i class="glyphicon glyphicon-edit"></i>编辑',
                        '</a>  ',
                        '<a class="btn btn-xs btn-danger" href="javascript:delBook(0)" title="Remove">',
                        '<i class="glyphicon glyphicon-remove"></i>删除',
                        '</a>'
                    ].join('');
                }
            }],
            onClickRow: function(row,$element,field){
                $('.success').removeClass('success');
                $($element).addClass('success');
            },
            onDblClickCell: function(field, value, row, $element){
                if(field == 'alias'){
                    //$element.empty();
                    //$element.append("<input type='text' name='alias' value='' />");
                    //return '<input type="text" name="alias" value="" />';
                }
            }
        });



    });
    $('#add').click(function(){
        location.href="123123";
    });

    function delBooks(book_id){
        if(book_id > 0){
            swal({
                title: "您确定要删除该书",
                text: "删除后将无法恢复，请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                closeOnConfirm: false,
                cancelButtonText:'取消'
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "__CONTROLLER__/delBooks",
                    data: "book_id="+book_id,
                    success: function(msg){
                        if(msg == 'success'){
                            tableList.bootstrapTable('remove',{
                                field: 'book_id',
                                values: [book_id]
                            });
                            swal("删除成功","","success");
                        }
                    }
                });
            });
        }
        return false;
    }

    function editBook(book_id){
        if(book_id > 0){
            //iframe窗
            parent.layer.open({
                type: 2,
                title: '编辑书本信息',
                shade: [0.5],
                area: ['800px', '800px'],
                fix: false, //不固定
                skin: 'layui-layer-molv',
                content: ['/editBook/book_id/'+book_id, 'no'], //iframe的url，no代表不显示滚动条
                end: function(){
                    $('#tableList').bootstrapTable('refresh',{url:'' });
                }
            });
        }
    }

    function editFields(id,fields,value) {
        $.ajax({
            type: "POST",
            url: "<{$edit_fields_url}>",
            data: "fields=" + fields + '&value=' + value + '&pk_id=' + id,
            success: function(msg){
                if(msg == 'success'){
                    tableList.bootstrapTable('remove',{
                        field: 'book_id',
                        values: [book_id]
                    });
                    swal("删除成功","","success");
                }
            }
        });

    }
</script>