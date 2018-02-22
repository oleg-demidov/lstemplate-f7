
{* Название компонента *}
{$component = 'card'}

{component_define_params params=[ 'header', 'content', 'contentPadding', 'footer', 'classes',  
    'attributes',  'attributesHeader',  'attributesContent',  'attributesFooter']}

{* Smarty-блок для изменения опций *}
{block 'nav_item_options'}{/block}

{* card*}
    
<div class="{$component} {cmods name=$component mods=$mods} {$classes}" {cattr list=$attributes} >
    {if $header}
        <div class="card-header" {cattr list=$attributesHeader}>{$header}</div>
    {/if}
    {if $content}
        <div class="card-content {if $contentPadding}card-content-padding{/if}" {cattr list=$attributesContent}>{$content}</div>
    {/if}
    {if $footer}
        <div class="card-footer" {cattr list=$attributesFooter}>{$footer}</div>
    {/if}
</div>

