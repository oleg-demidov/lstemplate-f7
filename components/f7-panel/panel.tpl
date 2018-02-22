{**
 * Тулбар
 *}

{$component = 'panel'}
{component_define_params params=[ 'items', 'mods', 'classes', 'attributes', 'content', 'panelMods' ]}

{block 'toolbar_options'}
    {assign var='arrMods' value=" "|explode:$panelMods}
    {foreach $arrMods as $mod}
        {if {$mod|trim} != ''}
            {$classes = "$classes panel-$mod"}
        {/if}
    {/foreach}
    
{/block}

<div class="{$component} {cmods name=$component mods=$mods} {$classes}" {cattr list=$attributes}>
    {$content}
</div>
