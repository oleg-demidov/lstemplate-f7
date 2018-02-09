{**
 * Юзербар
 *}
{$component = "fl-userbar"}
<li class="{$component}">
{if $oUserCurrent}
    {capture 'pro'}
        {component 'badge' value=$oUserCurrent->getPro() mods="success"}        
    {/capture}
    {capture 'profile'}
        {component 'user' classes="{$component}-profile" template='avatar' size='small' user=$oUserCurrent}      
    {/capture}
    {$aMenuItems = [
        ['name' => 'profile', 'html'=>$smarty.capture.profile],
        [ 'name' => '-' ] 
    ]}
    {if !$oUserCurrent->isManager()}
    {$aMenuItems = array_merge($aMenuItems, [
        [ 'icon'=>'file-text-o', 'name' => 'orders',       'text' => {lang name='plugin.freelancer.menu.orders'},     'url' => "{$oUserCurrent->getUserWebPath()}orders", 'count' => $oUserCurrent->getCountOrders() ]
    ])}
    {/if}
    {$aMenuItems = array_merge($aMenuItems, [
        [ 'icon'=>'envelope-o', 'name' => 'talk',       'text' => {lang name='user.profile.nav.messages'},     'url' => "{router page='talk'}", 'count' => $iUserCurrentCountTalkNew ],
        [ 'icon'=>'cogs', 'name' => 'settings',   'text' => {lang name='user.profile.nav.settings'},     'url' => "{router page='settings'}" ]
    ])}
    {if $oUserCurrent->isEmployer()}
        {if $oUserCurrent->isCreateOrder()}
        {*$aMenuItems[] = ['icon'=>'file-text-o', 'text' => $aLang.plugin.freelancer.menu.create_order,'url'  => {router page='order/add'},'name' => 'create_order']*}
        {$aMenuItems[] = ['html'=>{component 'button' mods="success" classes="{$component}-addorder" text=$aLang.plugin.freelancer.menu.create_order url={router page='order/add'}}]}
        {else}
            {$aMenuItems[] = ['html'=>{component 'freelancer:market'  text=$aLang.plugin.freelancer.menu.create_order }]}        
        {/if}
    {/if}
    
    {$aMenuItems = array_merge($aMenuItems, [
        [ 'name' => '-' ],
        [ 'icon'=>'sign-out', 'text' => $aLang.auth.logout,  'url' => "{router page='auth'}logout/?security_ls_key={$LIVESTREET_SECURITY_KEY}" ]

    ])}
    {$aItems=[
        [ 'name' => 'userbar', 'url' => "{$oUserCurrent->getUserWebPath()}", 'count'=>"{$oUserCurrent->getPro()}",
        'text' => "<img src=\"{$oUserCurrent->getProfileAvatarPath(30)}\" alt=\"{$oUserCurrent->getDisplayName()}\" class=\"{$component}-avatar\" /> {$smarty.capture.pro}", 
        'menu' => [
            'items' => $aMenuItems
        ]]
    ]}
    
    {else}
        {$aItems = [
                    [ 'text' => $aLang.auth.login.title,        'classes' => 'js-modal-toggle-login',        'url' => {router page='auth/login'} ],
                    [ 'text' => $aLang.auth.registration.title, 'classes' => 'js-modal-toggle-registration', 'url' => {router page='auth/register'} ]
                ]}
    {/if}
    
    {component 'nav' hook='fl_userbar_nav' hookParams=[ user => $oUserCurrent ] mods="userbar" items=$aItems}
  
</li>
