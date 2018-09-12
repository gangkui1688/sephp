$(function () {
    form_ob = $('form.validate')
    for(key in form_ob){
        form_ob.eq(key).validate();
    }

    //选择分页条数
    $('#pages #page-select').on('change',function () {
        window.document.location.href = window.document.location.href + '&page_num=' + $(this).val();
    });


    $("#side-menu").on('click','li',function () {
        alert(123);
    })

})