{**
 * Регистрация
 *}

{extends 'layouts/layout.base.tpl'}

{block 'layout_page_title'}
    <div class="login-screen-title">{$aLang.auth.registration.title}</div>
{/block}

{block 'layout_page_content' append}
    {component 'f7-auth' template='registration'}
{/block}