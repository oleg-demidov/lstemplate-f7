{**
 * Тулбар
 *}

{$component = 'navbar'}
{component_define_params params=[ 'mods', 'content', 'left', 'title', 'right', 'classes', 'attributes' ]}

{block 'navbar_options'}
    {assign var='arrMods' value=" "|explode:$panelMods}
    {foreach $arrMods as $mod}
        {if {$mod|trim} != ''}
            {$classes = "$classes panel-$mod"}
        {/if}
    {/foreach}
    
{/block}

<div class="{$component} {$classes} {cmods name=$component mods=$mods}" {cattr list=$attributes}>
        <div class="navbar-inner">
            {if $content}
                {$content}
            {else}
                <div class="left">
                    {$left}
                </div>
           
                <div class="title">
                    {$title}
                </div>
            
                <div class="right">
                    {$right}
                </div>
            {/if}
        </div>
</div>
