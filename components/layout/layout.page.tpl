{**
*  Начало page
*}

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
        
        {*  
            Fixed toolbar goes ALWAYS after Navbar 
        *}
        {block 'layout_toolbar_fixed'}{/block} 

        {**
        *  Контент page
        *}
        <div class="page-content {$classesPageContent}">

            {block 'layout_page_content'}

                {block 'layout_page_title'}{/block}

                {$layoutSidebarBlocks}

                {show_blocks group='top' }

            {/block}
            
            {*  
                Static toolbar goes in the end inside of page-content
            *}
            {block 'layout_toolbar_static'}{/block} 
        </div>
    
</div>
       