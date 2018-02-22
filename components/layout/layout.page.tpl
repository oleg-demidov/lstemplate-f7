{**
*  Начало page
*}

<div data-name="home" class="page">

        {**
        *  Верхняя панель
        *}
        {capture name='left'}
            <a href="#" class="link icon-only back panel-open" data-panel="left">{component "f7-icon" icon="menu"}</a>
        {/capture}
        
        {capture name='right'}
            <a href="#" class="link icon-only back panel-open" data-panel="right"><i class="icon icon-back"></i></a>
        {/capture}
        
        {block 'layout_navbar'}
            {component 'f7-navbar'
                left=$smarty.capture.left
                title=$sHtmlTitle
                right=$smarty.capture.right
            }
        {/block} 
        
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
       