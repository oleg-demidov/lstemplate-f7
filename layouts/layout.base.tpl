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
    {$classes = "{Config::Get('view.f7_theme_color')} {Config::Get('view.theme_layout.theme_layout')}"}
    
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
            
            {block 'layout_panel'}
                {capture name="panel_content"}
                    {if !$oUserCurrent}
                        {$oUserCurrent = Engine::GetEntity('User_User')}
                    {/if}
                    {$aLoginItems = [
                        ['text' => {$aLang.auth.login.title}, 'url' => "/auth/login", 'classes'=>"panel-close"],
                        ['text' => {$aLang.auth.registration.title}, 'url' => '/auth/register', 'classes'=>"panel-close"]
                    ]}
                    {component 'f7-user.card' 
                        content=$oUserCurrent->getProfileName()
                        avatar=$oUserCurrent->getProfileAvatarPath()
                        links=$aLoginItems
                    }    
                    
                    {component 'nav-menu'}   
                    
                {/capture}
                {component 'f7-panel' panelMods='right cover' content=$smarty.capture.panel_content}
            {/block}
            
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
                    {block 'layout_common_toolbar'}
                        
                        {*component 'f7-toolbar' items=[
                            [  'url' => {router page='/'},      'name' => 'blog', 'icon' => ['name'=>'list' ]],
                            [ 'text' => $aLang.blog.blogs,     'url' => {router page='blogs'},  'name' => 'blogs' ],
                            [ 'text' => $aLang.user.users,     'url' => {router page='people'}, 'name' => 'people' ],
                            [ 'text' => $aLang.activity.title, 'url' => {router page='stream'}, 'name' => 'stream' ]
                        ]*}
                    
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