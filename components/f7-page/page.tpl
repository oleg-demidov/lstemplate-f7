

{* Название компонента *}
{$component = 'f7-page'}

{component_define_params params=[ 'name', 'content', 'classes', 'attributes', 'navbar', 'toolbar']}


{* Smarty-блок для изменения опций *}
{block 'page_options'}{/block}

{* page*}
    
<div class="page {cmods name=$component mods=$mods} {$classes}" {cattr list=$attributes} data-name="{$name}">
    {$navbar}
    <div class="page-content">
          {$content}
    </div>
    {$toolbar}
</div>
