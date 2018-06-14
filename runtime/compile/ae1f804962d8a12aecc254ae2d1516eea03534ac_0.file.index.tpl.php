<?php
/* Smarty version 3.1.32, created on 2018-06-12 15:10:17
  from '/Users/gangkui/wwwroot/www/www.sephp.com/admin/view/index/index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32',
  'unifunc' => 'content_5b1f71d945a851_07624860',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ae1f804962d8a12aecc254ae2d1516eea03534ac' => 
    array (
      0 => '/Users/gangkui/wwwroot/www/www.sephp.com/admin/view/index/index.tpl',
      1 => 1528787407,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5b1f71d945a851_07624860 (Smarty_Internal_Template $_smarty_tpl) {
echo $_smarty_tpl->tpl_vars['title']->value;?>



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
<?php echo '<script'; ?>
 src="./static/js/jquery.min.js" ><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
>
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


<?php echo '</script'; ?>
><?php }
}
