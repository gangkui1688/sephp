<{$title}>


<h3>
    username!!!!
</h3>



<hr>

<form method="OPTIONS" action="" >
    <input type="text" value="admin" name="username" />
    <input type="text" value="admin999" name="passwd" />
    <input type="submit" />
</form>
<hr>
<a href="javascript:start_ajax()">开始ajax</a>
<script src="./static/js/jquery.min.js" ></script>
<script>
    function start_ajax() {
        $.ajax({
            type: "POST",
            cache: false,
            url: "http://spotato.a.com/admin/?ct=home&ac=expense",
            data: "name=John&location=Boston",
            dataType:'json',
            success: function(msg){
                alert( "Data Saved: " + msg );
            }
        });
    }


</script>