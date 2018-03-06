{**
 * Форма входа
 *
 * @param string $redirectUrl
 * @param boolean $showExtra
 *}
{$component="login"}

{component_define_params params=[ 'redirectUrl', 'showExtra' ]}

{$aInputs = [
    [
        'type' => 'text', 
        'label' => {lang 'f7.auth.login'}, 
        'placeholder' => {lang 'f7.auth.info_login_validate' from=1 to=100}, 
        'pattern' => '\w{1,100}'
    ],
    [
        'type' => 'password', 
        'label' => {lang 'f7.auth.password'}, 
        'placeholder' => {lang 'f7.auth.info_pass_validate' from=5 to=100}, 
        'pattern' => '\w{1,100}'
    ]
]}

{block 'login_form_options'}
{/block}
    
<form action="{router page='auth/login'}" method="post" class="{$component} js-auth-login-form">
    
    {hook run='login_begin'}

    {component 'f7-list.inputs' items=$aInputs}
    
    {hook run='login_end'}
    
    {component 'f7-block' 
        content={component 'f7-button' 
                    styles="fill" 
                    text=$aLang.auth.login.form.fields.submit 
                    classes="g-recaptcha"
                    attributes=['data-sitekey' => {Config::Get('recaptcha.sitekey')}, 
                                'data-callback' => 'onSubmitRecaptcha']
                }
    }
    
    
    
</form>
    
    
{if $showExtra}
    {component 'f7-list' items=[
        [
            'inner' => ['content' => {$aLang.auth.registration.title}], 
            'url' => 'auth/register'
        ],
        [
            'inner' => ['content' => {$aLang.auth.reset.title}], 
            'url' => 'auth/password-reset'
        ]
    ]}
   
{/if}
