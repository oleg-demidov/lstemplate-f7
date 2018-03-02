{**
*  Начало page
*}

{*include "{$LS->Component_GetPath('f7-page')}/page.tpl"*}

<div data-name="home" class="page">

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

        {**
        *  Контент page
        *}
        <div class="page-content {$classesPageContent}">

            {block 'layout_page_content'}

                {block 'layout_page_title'}{/block}

                {$layoutSidebarBlocks}

            {/block}
            
            {show_blocks group='top' }
            
        </div>
    
</div>
{**
*  Конец page
*}

{block 'layout_toolbar'}
    <div class="toolbar toolbar-bottom-md">
        {block 'layout_toolbar_inner'}
            <div class="toolbar-inner">
                <!-- Toolbar links -->
                <a href="#" class="link">Link 1</a>
                <a href="#" class="link">Link 2</a>
            </div>
        {/block}
    </div>
{/block}
                    