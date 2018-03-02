{**
 * Список
 *}

{$component = 'list'}
{component_define_params params=[ 'items', 'classes', 'attributes', 'hook' , 'liClasses']}

{if $hook}
    {hook run="list_{$hook}" assign='hookItems' params=$hookParams items=$items array=true}
    {$items = ( $hookItems ) ? $hookItems : $items}
{/if}

{block 'list_options'}
    {$itemComponent = 'f7-list.item'}
    {$liClasses = ""}
{/block}

<div class="{$component} {$classes} {cmods name=$component mods=$mods}" {cattr list=$attributes}>
    <ul>
        {foreach $items as $item}
            {component $itemComponent params=$item classes="{$liClasses}"}                
        {/foreach}
    </ul>
</div>