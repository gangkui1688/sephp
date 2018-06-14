<?php
/* Smarty version 3.1.32, created on 2018-06-13 11:39:02
  from '/Users/gangkui/wwwroot/www/www.sephp.com/admin/view/baidu/add.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32',
  'unifunc' => 'content_5b2091d6102fa7_21991938',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'a49350c9d049feac212b27f286d87dd756a37223' => 
    array (
      0 => '/Users/gangkui/wwwroot/www/www.sephp.com/admin/view/baidu/add.tpl',
      1 => 1528808413,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5b2091d6102fa7_21991938 (Smarty_Internal_Template $_smarty_tpl) {
?>
<ul>
    <?php
$_smarty_tpl->tpl_vars['foo'] = new Smarty_Variable(null, $_smarty_tpl->isRenderingCache);$_smarty_tpl->tpl_vars['foo']->step = 1;$_smarty_tpl->tpl_vars['foo']->total = (int) ceil(($_smarty_tpl->tpl_vars['foo']->step > 0 ? 10+1 - (1) : 1-(10)+1)/abs($_smarty_tpl->tpl_vars['foo']->step));
if ($_smarty_tpl->tpl_vars['foo']->total > 0) {
for ($_smarty_tpl->tpl_vars['foo']->value = 1, $_smarty_tpl->tpl_vars['foo']->iteration = 1;$_smarty_tpl->tpl_vars['foo']->iteration <= $_smarty_tpl->tpl_vars['foo']->total;$_smarty_tpl->tpl_vars['foo']->value += $_smarty_tpl->tpl_vars['foo']->step, $_smarty_tpl->tpl_vars['foo']->iteration++) {
$_smarty_tpl->tpl_vars['foo']->first = $_smarty_tpl->tpl_vars['foo']->iteration === 1;$_smarty_tpl->tpl_vars['foo']->last = $_smarty_tpl->tpl_vars['foo']->iteration === $_smarty_tpl->tpl_vars['foo']->total;?>
        <li><?php echo $_smarty_tpl->tpl_vars['foo']->value;?>
</li>
    <?php }
}
?>
</ul><?php }
}
