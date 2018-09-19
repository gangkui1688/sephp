$(function () {
    form_ob = $('form.validate')
    for(key in form_ob){
        form_ob.eq(key).validate();
    }

    //选择分页条数
    $('#pages #page-select').on('change',function () {
        if(window.location.href.match('page_num=\d*') == null)
        {
            window.document.location.href = window.document.location.href + '&page_num=' + $(this).val();
        }else{
            window.document.location.href = window.location.href.replace(/(page_num=)\d*/, '$110');
        }

    });

    //add-file-href，上传文件插件，全局应用
    $('.add-files-model').on('click',function () {
        layer.open({
            type: 2,
            title:'文件上传',
            shadeClose:true,
            skin: 'layui-layer-rim', //加上边框
            area: ['688px','550px'], //宽高
            content: '?ct=public&ac=add_file'
        });
    })

    $("#side-menu").on('click','li',function () {
        alert(123);
    })

})