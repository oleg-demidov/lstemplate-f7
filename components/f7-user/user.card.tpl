
{* Название компонента *}
{$component = 'user-card'}

{component_define_params params=[ 'avatar', 'content', 'footer', 'classes',  'attributes',  'links']}

{* Smarty-блок для изменения опций *}
{block 'user_card_options'}{/block}

{* card*}

{capture name="footer"}
    {foreach $links as $link}
        {component 'f7-link' params=$link}
    {/foreach}
{/capture}
    
{component 'f7-card' 
    params = $params
    attributesHeader = ['style' => "padding:0;"]
    header = "<img src='{$avatar}'/>"
    footer = $smarty.capture.footer
    classes = $component
}


