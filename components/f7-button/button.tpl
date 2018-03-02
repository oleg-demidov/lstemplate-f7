{**
 * Кнопка
 *}

{$component = 'button'}
{component_define_params params=[ 'text', 'url', 'color', 'type', 'styles', 'classes', 'attributes' ]}

{if $color}
    {$classes = "{$classes} color-{$color}"}
{/if}

{if $styles}
    {foreach " "|explode:$styles as $style}
        {$classes = "{$classes} button-{$style}"}
    {/foreach}
{/if}

{block 'button_options'}
    
{/block}


<{if $url}a{else}button{/if} class="{$component} {$classes}" type="{$type|default:'submit'}"  {cattr list=$attributes}>
    {$text}
</{if $url}a{else}button{/if}>

