

{* Название компонента *}
{$component = 'icon'}

{component_define_params params=[ 'style', 'icon', 'classes', 'mods',  'attributes' , 'badge', 'badgeColor', 'style']}

{$style = $style|default:Config::Get('view.icons_style')}

{$stylesIcon = [
    'md' => 'material-icons md-only',
    'ios' => 'f7-icons ios-only'
]}

{$classes = "{$classes} {$stylesIcon[$style]}"}

<i class="{$component}{$classes} {cmods name=$component mods=$mods}" {cattr list=$attributes}>
    {$icon}
    {if $badge}{component 'f7-badge' value=$badge color={$badgeColor}}{/if}
</i>

