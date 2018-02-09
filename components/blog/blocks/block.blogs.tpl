{**
 * Блок со списком блогов
 *}

{capture 'actionbar'}
    {if $oUserCurrent}
        {component 'actionbar'
            classes='createblog'
            mods="compact blogcreate"
            items=[
                [ 
                    'buttons' => [[ 'url' => {router page='blog/add'}, 'text'=>'Создать блог', 'mods'=>'primary large'  ]]
                ],
                [
                    'buttons' => [[ 'url' => {router page='content/add/topic'}, 'text'=>'Создать топик', 'mods'=>'success large' ]]
                ]
            ]}
    {/if}
{/capture}
 
{component 'block'
    mods     = 'blogs'
    classes  = 'blog-block-blogs js-block-default'
    title    = "{lang 'blog.blocks.blogs.title'} "
    titleUrl = {router page='blogs'}
    tabs  = [
        'classes' => 'js-tabs-block',
        'tabs' => [
            [ 'text' => {lang 'blog.blocks.blogs.nav.top'},    'url' => "{router page='ajax'}blogs/top",  'list' => $sBlogsTop ],
            [ 'text' => {lang 'blog.blocks.blogs.nav.joined'}, 'url' => "{router page='ajax'}blogs/join", 'is_enabled' => !! $oUserCurrent ],
            [ 'text' => {lang 'blog.blocks.blogs.nav.self'},   'url' => "{router page='ajax'}blogs/self", 'is_enabled' => !! $oUserCurrent ]
        ]
    ]
    footer={$smarty.capture.actionbar|trim}
    }