{**
 * Форма регистрации
 *
 * @param string $redirectUrl
 *}

{component_define_params params=[ 'redirectUrl' ]}

{$redirectUrl = $redirectUrl|default:$PATH_WEB_CURRENT}


<form action="{router page='user/register_role'}" method="post">

    {component 'freelancer:register.role' role=$sRole}

    {component 'button' name='submit_register' mods='primary' text=$aLang.auth.registration.form.fields.submit.text}
</form>

