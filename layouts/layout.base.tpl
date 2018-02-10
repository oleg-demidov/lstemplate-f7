{**
 * Основной лэйаут, который наследуют все остальные лэйауты
 *
 * @param boolean $layoutShowSidebar        Показывать сайдбар или нет, сайдбар не будет выводится если он не содержит блоков
 * @param string  $layoutNavContent         Название навигации
 * @param string  $layoutNavContentPath     Кастомный путь до навигации контента
 * @param string  $layoutShowSystemMessages Показывать системные уведомления или нет
 *}

{extends "component@layout.toggle"}

{block 'layout_options' append}
    {$layoutShowSidebar = $layoutShowSidebar|default:true}
    {$layoutShowSystemMessages = $layoutShowSystemMessages|default:true}
    {*
           Определение темы f7 шаблона
    *}
    {$classes = "{Config::Get('view.theme_color')} {Config::Get('view.theme_layout.theme_layout')}"}
    
    {$classesPageContent = "{$classesPageContent} {((Config::Get('view.hide_bars_on_scroll'))?"hide-bars-on-scroll":"")}"}
    {$classesPageContent = "{$classesPageContent} {((Config::Get('view.hide_toolbar_on_scroll'))?"hide-toolbar-on-scroll":"")}"}
{/block}

{block 'layout_head_styles' append}
    
{/block}

{block 'layout_head' append}
    
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui, viewport-fit=cover">
    <meta name="apple-mobile-web-app-capable" content="yes">
        
    {* Получаем блоки для вывода в сайдбаре *}
    {*if $layoutShowSidebar}
        {show_blocks group='left' assign=layoutSidebarBlocks}

        {$layoutSidebarBlocks = trim( $layoutSidebarBlocks )}
        {$layoutShowSidebar = !!$layoutSidebarBlocks}
    {/if*}

{/block}

{block 'layout_body' append}
    {hook run='layout_body_begin'}
    
    
    {**
     * Начало app
     *}
    <div id="app">
        {block 'layout_app'}
            
            <div class="panel panel-right">
                {block 'layout_panel_right'}
                    Панель
                {/block}
            </div>
            
            <div class="statusbar">
                {block 'layout_statusbar'}
                {/block}
            </div>
            
            {**
            *  Главный view
            *}
            <div class="view view-main">
                {block 'layout_view'}
                                
                    {*  
                        View common toolbar 
                    *}
                    {block 'layout_toolbar_common'}
                        
                        {component 'f7-toolbar' items=[
                            [ 'text' => $aLang.topic.topics,   'url' => {router page='/'},      'name' => 'blog', 'icon' => ['name'=>'list' ]],
                            [ 'text' => $aLang.blog.blogs,     'url' => {router page='blogs'},  'name' => 'blogs' ],
                            [ 'text' => $aLang.user.users,     'url' => {router page='people'}, 'name' => 'people' ],
                            [ 'text' => $aLang.activity.title, 'url' => {router page='stream'}, 'name' => 'stream' ]
                        ]}
                    
                    {/block}
                    
                    
                    {**
                    *  Начало page
                    *}
                    {block 'layout_page'}                       

                        {component 'layout.page'}
                        
                    {/block}
                    
                {/block}
            </div>
            {**
            *  Главный view конец
            *}            
            
        {/block}
    </div>
    {**
     * Конец app
     *}
  
   
{/block} 
{block 'layout_body_end' append}
    {*Config::Get('view')|print_r*}
    <script>
        ls.registry.set({json var = Config::Get('view')});
    </script>
{/block}