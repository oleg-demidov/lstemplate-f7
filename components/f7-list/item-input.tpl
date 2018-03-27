{**
 * Список
 *}

{$component = 'item-input'}
{component_define_params params=[ 'info', 'label', 'icon', 'media', 'inner', 'type', 'name', 'required', 'classes', 'attributes', 'placeholder', 'pattern' ]}

{block 'list_item_input_options'}
    {if $info}
        {$classes = "{$classes} {$component}-with-info"}
    {/if}
    
{/block}


<li class="{$component} item-content {$classes}">
    {if $icon}
        <div class="item-media">
            {component 'f7-icon' params=$icon}
        </div>
    {/if}
    {if $media}
        <div class="item-media">
            {$media}
        </div>
    {/if}
    <div class="item-inner">
        {if $inner}
            {$inner}
        {else}
            {if $label}
                <div class="item-title item-label">
                    {$label}
                </div>
            {/if}
            <div class="item-input-wrap">
                <input type="{$type}" name="{$name}" placeholder="{$placeholder}" pattern="{$pattern}" {if $pattern}required validate{/if} 
                       {if $required}required{/if}>
                <span class="input-clear-button"></span>
                {if $info}
                    <div class="item-input-info">{$info}</div>
                {/if}
            </div>
        {/if}
    </div>    
</li>
