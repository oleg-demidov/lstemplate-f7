{**
 * Страница входа
 *}

{extends 'layouts/layout.base.tpl'}

{block 'layout_page_title'}
    <div class="login-screen-title">{Config::Get('view.name')}</div>    
{/block}

{block 'layout_page_content' append}
    {component 'f7-auth' template='login' showExtra=true}
{/block}