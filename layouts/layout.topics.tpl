{**
 * Список топиков
 *}

{extends './layout.base.tpl'}

{block 'layout_page_content'}
    {component 'f7-link' url="/feed/" text="Лента"} 
    {component 'f7-link' url="/news/" text="Новости"} 
    {component 'f7-link' url="/index/newall/" text="Новые"}
     
{/block}