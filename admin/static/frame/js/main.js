$(function () {
    form_ob = $('form.validate')
    for(key in form_ob){
        form_ob.eq(key).validate();
    }


    $("#side-menu").on('click','li',function () {
        alert(123);
    })

})