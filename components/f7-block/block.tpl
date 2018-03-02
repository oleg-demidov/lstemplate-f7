{**
 * Блок
 *}

{$component = 'block'}
{component_define_params params=[ 'content', 'header', 'footer', 'styles', 'classes', 'attributes' ]}

{if $styles} 
    {foreach " "|explode:$styles as $style}
        {$classes = "{$classes} block-{$style}"}
    {/foreach}
{/if}

{block 'block_options'}
    
{/block}

<div class="{$component} {$classes}"  {cattr list=$attributes}>
    
    {if $header} 
        <div class="block-header">{$header}</div>
    {/if}
    
        {$content}
        
    {if $footer} 
        <div class="block-footer">{$footer}</div>
    {/if}
    
</div>