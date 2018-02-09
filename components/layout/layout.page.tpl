{**
*  Начало page
*}

{*include "{$LS->Component_GetPath('f7-page')}/page.tpl"*}

<div data-name="home" class="page">

        {**
        *  Верхняя панель
        *}
        <div class="navbar">
            {block 'layout_nawbar'}
                <div class="navbar-inner">
                    {block 'layout_nawbar_left'}
                        <div class="left">
                            <a href="#" class="link icon-only back">
                                <i class="icon icon-back"></i>
                            </a>
                        </div>
                    {/block}

                    {block 'layout_nawbar_title'}
                        <div class="title">
                                {$sHtmlTitle}
                        </div>
                    {/block}

                    {block 'layout_nawbar_right'}
                        <div class="right">
                            <a href="#" class="link icon-only">
                                <i class="icon icon-bars"></i>
                            </a>
                        </div>
                    {/block}
                </div>
            {/block}
        </div>



        {**
        *  Контент page
        *}
        <div class="page-content {$classesPageContent}">

            {block 'layout_page_content'}

                {block 'layout_page_title'}{/block}

                {$layoutSidebarBlocks}

                {show_blocks group='top' }

            {/block}
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
                    