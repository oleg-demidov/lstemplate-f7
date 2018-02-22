

{* Название компонента *}
{$component = 'link'}

{component_define_params params=[ 'menu', 'url', 'text', 'icon',  'popover', 'isExternal', 'isActive',  'attributes']}

{* Дефолтные значения *}
{$url = $url|default:'#'}

{* Установка модификаторов и классов *}
{$mods = ($count) ? "$mods has-badge" : $mods}
{$classes = ($isActive) ? "$classes active" : $classes}
{$classes = ($isExternal) ? "$classes external" : $classes}
{$target = ($target) ? "target=\"$target\"" : ''}

{if !$text}
    {$classes =  "{$classes} icon-only"}
{/if}

{if $popover}
    {$attributes['data-popover'] = $popover}
    {$classes = "{$classes} popover-open"}
{/if}


{* Smarty-блок для изменения опций *}
{block 'nav_item_options'}{/block}

{* link*}
    
<a class="{$component} {cmods name=$component mods=$mods} {$classes}" {cattr list=$attributes} href="{$url}">
    {if $icon}
        {component 'f7-icon' params=$icon }
        {if $text}
            <span>{$text}</span>
        {/if}       
    {else}
        {$text}
    {/if}    
</a>

