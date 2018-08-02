<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>首页--layui后台管理模板 2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="static/iframe/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="static/iframe/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="static/iframe/css/public.css" media="all" />
    <link rel="stylesheet" href="static/iframe/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/iframe/bootstrap-table/src/bootstrap-table.css">


    <script type="text/javascript" src="static/iframe/layui/layui.js"></script>
    <script type="text/javascript" src="static/js/jquery.min.js"></script>

    <script src="static/iframe/bootstrap/js/bootstrap.min.js"></script>
    <script src="static/iframe/bootstrap-table/src/bootstrap-table.js"></script>
    <script src="static/iframe/js/tableExport.js"></script>
    <script src="static/iframe/bootstrap-table/src/extensions/mobile/bootstrap-table-mobile.js"></script>
    <script src="static/iframe/bootstrap-table/src/extensions/editable/bootstrap-table-editable.js"></script>
    <script src="static/iframe/bootstrap-table/src/extensions/export/bootstrap-table-export.js"></script>
    <script src="static/iframe/js/bootstrap-editable.js"></script>
</head>
<body class="childrenBody">

    <div class="container">
        <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group" style="float: left;margin-top: 10px;">

        </div>
        <table id="tableList"></table>
    </div>
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
            //sortClass: 'admin_id',
            cache:true,
            showRefresh: true,
            showToggle: true,
            showFullscreen: true,
            showPaginationSwitch: true,//显示分页按钮开关
            buttonsAlign: 'left',
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
            pageSize: 3,//初始化页面条数
            pageList:[5,10,25,20,50],
            singleSelect: false,
            //data-locale: 'zh-US',
            search: true, //显示搜索框
            searchOnEnterKey: true,
            strictSearch: true,
            trimOnSearch: true, //True to trim spaces in search field.
            searchText: '请输入用户名',
            searchAlign: 'right',
            
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

                        var data = $table.bootstrapTable('getData'),
                            index = $(this).parents('tr').data('index');
                        console.log(data[index]);
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
                        '<a class="btn btn-xs btn-primary" href="javascript:void(0)" title="Like">',
                        '<i class="glyphicon glyphicon-edit"></i>编辑',
                        '</a>  ',
                        '<a class="btn btn-xs btn-danger" href="javascript:void(0)" title="Remove">',
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

</script>
</body>
</html>