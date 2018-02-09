{**
 * Навигация
 *
 * @param string  $hook
 * @param array   $hookParams
 * @param array   $items
 * @param string  $activeItem
 * @param boolean $showSingle
 * @param boolean $isSubnav
 * @param string  $mods
 * @param string  $classes
 * @param array   $attributes
 *}

{* Название компонента *}
{$component = 'f7-toolbar'}
{component_define_params params=[ 'hook', 'hookParams', 'items', 'activeItem', 'showSingle', 'isSubnav', 'items', 'mods', 'classes', 'attributes', 'bottom' ]}

{* Получаем пункты установленные плагинами *}
{if $hook}
    {hook run="toolbar_{$hook}" assign='hookItems' params=$hookParams items=$items array=true}
    {$items = ( $hookItems ) ? $hookItems : $items}
{/if}

{* Считаем кол-во неактивных пунктов *}
{$disabledItemsCounter = 0}

{foreach $items as $item}
    {$disabledItemsCounter = $disabledItemsCounter + ( ! $item['is_enabled']|default:true && $item['name'] != '-' )}
{/foreach}

{$classes = "{$classes} ls-clearfix"}

{if $isSubnav}
    {$mods = "$mods sub"}
{else}
    {$mods = "$mods root"}
{/if}

{if {$bottom|default:1}}
    {$classes = "{$classes} toolbar-bottom-md"}
{/if}

{* Smarty-блок для изменения опций *}
{block 'nav_options'}{/block}

{* Отображем меню только если есть активные пункты *}
{if count( $items ) - $disabledItemsCounter - ( ( $showSingle|default:true ) ? 0 : 1 )}
    <div class="{$component} toolbar {$classes} {cmods name=$component mods=$mods}" {cattr list=$attributes}>
        <div class="toolbar-inner">
            {foreach $items as $item}
                {$isEnabled = $item[ 'is_enabled' ]}

                {if $item['html']}
                    {$item['html']}
                {else}
                    {if $isEnabled|default:true}
                        {if $item['name'] != '-'}
                            {component 'nav' template='item'
                                isRoot   = !$isSubnav
                                activeItem = $activeItem
                                isActive = ($activeItem && $activeItem == $item['name'])
                                params   = $item}
                        {else}
                            {* Разделитель *}
                            <li class="{$component}-separator"></li>
                        {/if}
                    {/if}
                {/if}
            {/foreach}
        </div>
    </div>
{/if}
