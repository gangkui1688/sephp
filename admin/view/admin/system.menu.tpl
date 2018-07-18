<ul class="sidebar-menu" data-widget="tree">
    <li class="header"><{$menuTitle}></li>
    <{foreach from=$menus key="mykey" item="menu" }>
        <li class="treeview active open-menu">
            <a href="<{if empty($menu.url) }>#<{else}><{$menu.url}><{/if}>" >
                <i class="<{$menu.icon}>"></i> <span><{$menu.name}></span>

                <{if isset($menu.child)}>
                    <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
                <{/if}>
            </a>
            <{if isset($menu.child)}>
                <ul class="treeview-menu">
                    <{foreach from=$menu.child item=child}>
                        <li class="<{if $child.default == 'true' }>active<{/if}>" >
                            <a href="<{$child.url}>"><i class="<{$child.icon}>"></i><{$child.name}></a>
                        </li>
                    <{/foreach}>
                </ul>

            <{/if}>
        </li>

    <{/foreach}>

    <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
</ul>