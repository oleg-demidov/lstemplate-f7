{*
*   Костыль вместо наследования {extends "component@layout.{Config::Get('view.layout')}"}
*}

{if Config::Get('view.ajax')}
    {include "component@layout.page"}
{else}
    
    {include "component@layout.layout"}
{/if}
