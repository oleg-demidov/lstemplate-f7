{**
*  Начало page
*}

{*include "{$LS->Component_GetPath('f7-page')}/page.tpl"*}

<div data-name="home" class="page">
    
    {block 'layout_page_start'}
        {if Config::Get('view.ajax')}
            {$aHtmlHeadFiles.css}
        {/if}
    {/block}
    {**
    *  Верхняя панель
    *}
    {block 'layout_navbar'}

        {component 'f7-navbar'
            left    =   {component 'f7-link' 
                            classes='back' 
                            icon=['style'=> 'md', 'icon'=>'chevron_left'] 
                            url='#'}
            title   =   $sHtmlTitle
            right   =   {component 'f7-link' 
                            attributes=['data-panel'=>'right']
                            icon=['style'=> 'md', 'icon'=>'menu'] 
                            url='#' classes="panel-open"}
        }

    {/block}
    
    {block 'layout_fixed_toolbar'}{/block}

    {**
    *  Контент page
    *}
    <div class="page-content {$classesPageContent}">

        {block 'layout_page_content'}

            {block 'layout_page_title'}{/block}

            {$layoutSidebarBlocks}

        {/block}

        {show_blocks group='top' }
        
        {block 'layout_static_toolbar'}{/block}

    </div>
        
    {block 'layout_page_end'}
        {* Подключение скриптов указанных в конфиге *}
        {if Config::Get('view.ajax')}
            {$aHtmlHeadFiles.js}

            <script id="eval_script">
                ls.lang.load({json var = $aLangJs});
                ls.registry.set({json var = $aVarsJs});
            </script>
        {/if}
    {/block}   
    
</div>
{**
*  Конец page
*}    