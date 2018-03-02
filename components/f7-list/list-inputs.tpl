{**
 * Список
 *}
{extends "component@f7-list"}

{block 'list_options'}
    {$itemComponent = 'f7-list.input'}
    {$liClasses = "item-content item-input"}
{/block}

<div class="{$component} {$classes} {cmods name=$component mods=$mods}" {cattr list=$attributes}>
    <ul>
        {foreach $items as $item}
            {component $itemComponent params=$item classes="{$liClasses}"}                
        {/foreach}
    </ul>
</div>