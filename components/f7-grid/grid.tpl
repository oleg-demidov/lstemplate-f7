{**
 * Сетка
 *}

{$component = 'grid'}
{component_define_params params=[ 'items', 'styles', 'classes', 'attributes' ]}

{if $styles} 
    {foreach " "|explode:$styles as $style}
        {$classes = "{$classes} {$style}"}
    {/foreach}
{/if}

{block 'grid_options'}
    
{/block}

<div class="{$component} {$classes}"  {cattr list=$attributes}>
    <div class="row">
        {foreach $items as $item}
            {if is_array($item)}
                <div class="{if $item.col}col-{$item.col}{else}col{/if}">
                    {$item.content}
                </div>
            {else}
                <div class="col">
                    {$item}
                </div>
            {/if}
            
        {/foreach}
    </div>
</div>