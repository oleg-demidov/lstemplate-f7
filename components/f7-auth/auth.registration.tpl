{**
 * Форма регистрации
 *
 * @param string $redirectUrl
 *}
{$component="registration-form"}

{component_define_params params=[ 'redirectUrl' ]}

{$redirectUrl = $redirectUrl|default:$PATH_WEB_CURRENT}

{$aInputs = [
    [
        'type' => 'text', 
        'name' => 'login',
        'label' => {lang 'f7.auth.login'}, 
        'placeholder' => {lang 'f7.auth.info_login_validate' from=1 to=100}, 
        'pattern' => '\w{1,100}'
    ],
    [
        'type' => 'email', 
        'name' => 'email',
        'label' => {lang name='field.email.label'}, 
        'placeholder' => {lang name='field.email.label'}
    ],
    [
        'type' => 'password', 
        'name' => 'password',
        'label' => {lang 'auth.labels.password'}, 
        'placeholder' => {lang 'f7.auth.info_pass_validate' from=5 to=100}, 
        'pattern' => '\w{1,100}'
    ],
    [
        'type' => 'password', 
        'name' => 'password_confirm',
        'label' => $aLang.auth.registration.form.fields.password_confirm.label, 
        'placeholder' => {lang 'f7.auth.info_pass_validate' from=5 to=100}, 
        'pattern' => '\w{1,100}'
    ]
]}

{block 'login_form_options'}
{/block}



<form action="{router page='auth/register'}" method="post" class="{$component} js-auth-registration-form">
    
    {hook run='registration_begin'}

    {component 'f7-list.inputs' items=$aInputs}
    
    {hook run='registration_end'}
    
    {component 'f7-block' 
        content={component 'f7-button' 
                    styles="fill" 
                    text=$aLang.auth.registration.form.fields.submit.text
                    classes="g-recaptcha"
                    attributes=['data-sitekey' => {Config::Get('recaptcha.sitekey')}, 
                                'data-callback' => 'onSubmitRecaptcha']
                }
    }
    
    
    
</form>

