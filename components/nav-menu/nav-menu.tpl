
{* Название компонента *}
{$component = 'nav-menu'}

{component_define_params params=[  ]}

{* Smarty-блок для изменения опций *}
{block 'nav_menu_options'} {/block}

{* nav-menu *}

{component 'f7-list' hook="nav_menu" items=[
    [ 'inner' => ['title' => $aLang.topic.topics],   'url' => {router page='/'},      'name' => 'blog' ],
    [ 'inner' => ['title' =>  $aLang.blog.blogs],     'url' => {router page='blogs'},  'name' => 'blogs' ],
    [ 'inner' => ['title' =>  $aLang.user.users],     'url' => {router page='people'}, 'name' => 'people' ],
    [ 'inner' => ['title' =>  $aLang.activity.title], 'url' => {router page='stream'}, 'name' => 'stream' ]
]}


