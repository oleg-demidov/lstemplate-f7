

{* Название компонента *}
{$component = 'badge'}

{component_define_params params=[ 'value', 'color', 'classes']}

<span class="{$component} color-{$color} {$classes}">{$value}</span>