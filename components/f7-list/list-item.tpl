{**
 * Список
 *}

{$component = 'list-item'}
{component_define_params params=[ 'content', 'url', 'icon', 'media', 'inner', 'after', 'classes', 'attributes' ]}

{block 'list_item_options'}
    
{/block}


<li class="{$classes}">
    {if $content}
        {$content}
    {else}
        <{if $url}a href="{$url}" class="item-link {else}div class="{/if}item-content">
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
                {if $inner.content}
                    {$inner.content}
                {else}
                    {if $inner.title}
                        <div class="item-title">
                            {$inner.title}
                        </div>
                    {/if}
                    {if $inner.after}
                        <div class="item-after">
                            {$inner.after}
                        </div>
                    {/if}
                {/if}
            </div>
        </{if $url}a{else}div{/if}>
    {/if}
</li>
            