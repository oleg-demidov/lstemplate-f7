{**
 * Настройка уведомлений
 *}

{* @hook Начало формы с настройками уведомлений *}
{hook run='user_settings_tuning_begin'}

<form action="{router page='settings'}tuning/" method="POST" enctype="multipart/form-data">
    {hook run='form_settings_tuning_begin'}

    {component 'field' template='hidden.security-key'}

    <fieldset>
        <legend>{lang name='user.settings.tuning.email_notices'}</legend>

        <div class="ls-field-checkbox-group">
            {component 'field' template='checkbox'
                     name     = 'settings_notice_new_topic'
                     checked  = $oUserCurrent->getSettingsNoticeNewTopic() != 0
                     noMargin = true
                     label    = {lang name='user.settings.tuning.fields.new_topic'}}

            {component 'field' template='checkbox'
                     name     = 'settings_notice_new_comment'
                     checked  = $oUserCurrent->getSettingsNoticeNewComment() != 0
                     noMargin = true
                     label    = {lang name='user.settings.tuning.fields.new_comment'}}

            {component 'field' template='checkbox'
                     name     = 'settings_notice_new_talk'
                     checked  = $oUserCurrent->getSettingsNoticeNewTalk() != 0
                     noMargin = true
                     label    = {lang name='user.settings.tuning.fields.new_talk'}}
            {component 'field' template='checkbox'
                     name     = 'notify_email_response'
                     checked  = $oUserCurrent->getSettings('notify_email_response') != 0
                     noMargin = true
                     label    = "При отзыве"}

            {component 'field' template='checkbox'
                     name     = 'settings_notice_reply_comment'
                     checked  = $oUserCurrent->getSettingsNoticeReplyComment() != 0
                     noMargin = true
                     label    = {lang name='user.settings.tuning.fields.reply_comment'}}

            {component 'field' template='checkbox'
                     name     = 'settings_notice_new_friend'
                     checked  = $oUserCurrent->getSettingsNoticeNewFriend() != 0
                     noMargin = true
                     label    = {lang name='user.settings.tuning.fields.new_friend'}}
            {if $oUserCurrent->getStrRole() == "master"}
                {component 'field' template='checkbox'
                     name     = 'notify_email_order'
                     checked  = $oUserCurrent->getSettings('notify_email_order') != 0
                     noMargin = true
                     label    = "При  новом личном заказе"}
                {component 'field' template='checkbox'
                     name     = 'notify_email_orders'
                     checked  = $oUserCurrent->getSettings('notify_email_orders') != 0
                     noMargin = true
                     label    = "При  новых заказах Вашей специальности"}
            {else}
                {component 'field' template='checkbox'
                     name     = 'notify_email_bid'
                     checked  = $oUserCurrent->getSettings('notify_email_bid') != 0
                     noMargin = true
                     label    = "При новом отклике на заказ"}
                {component 'field' template='checkbox'
                     name     = 'notify_email_order_start'
                     checked  = $oUserCurrent->getSettings('notify_email_order_start') != 0
                     noMargin = true
                     label    = "При старте заказа"}
            {/if}
        </div>
    </fieldset>
        
    
    
        
    <fieldset id="settings_tuning">
        <legend>Уведомления на панели</legend>

        <div class="ls-field-checkbox-group">
            {component 'field' template='checkbox'
                     name     = 'panel_notify_talk'
                     checked  = $oUserCurrent->getSettings('notify_panel_talk') != 0
                     noMargin = true
                     label    = "При новом сообщении"}
            {component 'field' template='checkbox'
                     name     = 'notify_panel_response'
                     checked  = $oUserCurrent->getSettings('notify_panel_response') != 0
                     noMargin = true
                     label    = "При отзыве"}

            {if $oUserCurrent->getStrRole() == "master"}
                {component 'field' template='checkbox'
                     name     = 'notify_panel_order'
                     checked  = $oUserCurrent->getSettings('notify_panel_order') != 0
                     noMargin = true
                     label    = "При  новом личном заказе"}
                {component 'field' template='checkbox'
                     name     = 'notify_panel_orders'
                     checked  = $oUserCurrent->getSettings('notify_panel_orders') != 0
                     noMargin = true
                     label    = "При  новых заказах Вашей специальности"}
            {else}
                {component 'field' template='checkbox'
                     name     = 'notify_panel_order_start'
                     checked  = $oUserCurrent->getSettings('notify_panel_order_start') != 0
                     noMargin = true
                     label    = "При старте заказа"}
                {component 'field' template='checkbox'
                   name     = 'notify_panel_bid'
                   checked  = $oUserCurrent->getSettings('notify_panel_bid') != 0
                   noMargin = true
                   label    = "При новом отклике на заказ"}
            {/if}
        </div>
    </fieldset>

    {if $oUserCurrent->isNotifySms()}
    <fieldset>
        <legend>Уведомления на смс</legend>

        <div class="ls-field-checkbox-group">
            {component 'field' template='checkbox'
                     name     = 'sms_notify_talk'
                     checked  = $oUserCurrent->getSettings('notify_sms_talk') != 0
                     noMargin = true
                     label    = "При новом сообщении"}
                     
            {component 'field' template='checkbox'
                     name     = 'notify_sms_response'
                     checked  = $oUserCurrent->getSettings('notify_sms_response') != 0
                     noMargin = true
                     label    = "При отзыве"}

            {if $oUserCurrent->getStrRole() == "master"}
                {component 'field' template='checkbox'
                     name     = 'notify_sms_order'
                     checked  = $oUserCurrent->getSettings('notify_sms_order') != 0
                     noMargin = true
                     label    = "При  новом личном заказе"}
                {component 'field' template='checkbox'
                     name     = 'notify_sms_orders'
                     checked  = $oUserCurrent->getSettings('notify_sms_orders') != 0
                     noMargin = true
                     label    = "При  новых заказах Вашей специальности"}
            {else}
                {component 'field' template='checkbox'
                     name     = 'notify_sms_bid'
                     checked  = $oUserCurrent->getSettings('notify_sms_bid') != 0
                     noMargin = true
                     label    = "При новом отклике на заказ"}
                {component 'field' template='checkbox'
                     name     = 'notify_sms_order_start'
                     checked  = $oUserCurrent->getSettings('notify_sms_order_start') != 0
                     noMargin = true
                     label    = "При старте заказа"}
            {/if}
            {*component 'field' template='checkbox'
                     name     = 'settings_notice_reply_comment'
                     checked  = $oUserCurrent->getSettingsNoticeReplyComment() != 0
                     noMargin = true
                     label    = {lang name='user.settings.tuning.fields.reply_comment'}}

            {component 'field' template='checkbox'
                     name     = 'settings_notice_new_friend'
                     checked  = $oUserCurrent->getSettingsNoticeNewFriend() != 0
                     noMargin = true
                     label    = {lang name='user.settings.tuning.fields.new_friend'}*}
        </div>
    </fieldset>
    {else}
        {component 'freelancer:market' text="Включить SMS уведомления" sTargetType="role" iTargetId="{$oUserCurrent->getStrRole()}_notify_sms"}
        <div style="margin: 20px;"></div>
    {/if}
    
    <fieldset>
        <legend>{lang name='user.settings.tuning.general'}</legend>

        {foreach $aTimezoneList as $timezone}
            {$timezoneLang=$aLang.date.timezones[ $timezone ]}
            {if $timezoneLang}
                {$timezones[] = [
                    'value' => $timezone,
                    'text' => $timezoneLang
                ]}
            {/if}
        {/foreach}

        {component 'field' template='select'
                 name          = 'settings_general_timezone'
                 label         = {lang name='user.settings.tuning.fields.timezone.label'}
                 items         = $timezones
                 selectedValue = $_aRequest.settings_general_timezone}
    </fieldset>

    {* @hook Конец формы с настройками уведомлений *}
    {hook run='user_settings_tuning_end'}

    {component 'button' text=$aLang.common.save mods='primary'}
</form>

{hook run='settings_tuning_end'}