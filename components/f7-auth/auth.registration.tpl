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
        'required' => true,
        'label' => {lang 'f7.auth.login'}, 
        'placeholder' => {lang 'f7.auth.info_login_validate' from=1 to=100}, 
        'pattern' => '\w{1,100}'
    ],
    [
        'type' => 'email', 
        'name' => 'mail',
        'required' => true,
        'label' => {lang name='field.email.label'}, 
        'placeholder' => {lang name='field.email.label'}
        
    ],
    [
        'type' => 'password', 
        'name' => 'password',
        'required' => true,
        'label' => {lang 'auth.labels.password'}, 
        'placeholder' => {lang 'f7.auth.info_pass_validate' from=5 to=100}, 
        'pattern' => '\w{1,100}'
    ],
    [
        'type' => 'password', 
        'name' => 'password_confirm',
        'required' => true,
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
    
    {component 'f7-block' content={hook run='registration_end'}}
    
    {component 'f7-block' 
        content={component 'f7-button' 
                    styles="fill" 
                    text=$aLang.auth.registration.form.fields.submit.text
                    type='submit'
                }
    }
    {component 'f7-button' 
        attributes= ['style' => 'display:none;'] 
        classes=    'js-recaptcha-button'
        text=       ' '
        type=       'button'
    }
    
    
    
</form>

