

{* Название компонента *}
{$component = 'f7-badge'}

{component_define_params params=[ 'value', 'color', 'classes']}

<span class="{$component} badge color-{$color} {$classes}">{$value}</span>