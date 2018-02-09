

{* Название компонента *}
{$component = 'f7-icon'}

{component_define_params params=[ 'style', 'name', 'classes', 'mods',  'attributes' , 'badge', 'badgeColor']}

{$style = $style|default:'md'}

{$stylesIcon = [
    'md' => 'material-icons md-only',
    'ios' => 'f7-icons ios-only'
]}

{if}
    {$classes = "{$classes} {$stylesIcon[$style]}"}
{/if}

<i class="{$component} icon {$classes} {cmods name=$component mods=$mods}" {cattr list=$attributes}>
    {$name}
    {if $badge}{component 'f7-badge' value=$badge color={$badgeColor}}{/if}
</i>
