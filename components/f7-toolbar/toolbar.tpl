{**
 * Тулбар
 *}

{$component = 'toolbar'}
{component_define_params params=[ 'items', 'mods', 'classes', 'attributes', 'limitShowText' ]}

{block 'toolbar_options'}
    {$limitShowText = {$limitShowText|default:4}}
    {$hideText = ($limitShowText < {$items|@sizeof})}
{/block}

<div class="{$component} {cmods name=$component mods=$mods} {$classes} toolbar-bottom-md" {cattr list=$attributes}>
    <div class="toolbar-inner">
        {block 'toolbar_inner'}
            {if is_array($items)}
                
                    
                {foreach $items as $item}
                    {if $hideText}
                        {$item.text = ""}
                    {/if}
                    {component 'f7-link' params=$item}
                {/foreach}
                
            {else}
                {$items}
            {/if}

        {/block}
    </div>
</div>