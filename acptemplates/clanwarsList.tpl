{include file='header' pageTitle='wcf.acp.clanwars.list'}

<header class="boxHeadline">
    <h1>{lang}wcf.acp.clanwars.list{/lang}</h1>
    <script data-relocate="true">
        //<![CDATA[
        $(function() {
            new WCF.Action.Delete('wcf\\data\\clanwars\\ClanwarsAction', '.jsClanwarsRow');
            new WCF.Action.Toggle('wcf\\data\\clanwars\\ClanwarsAction', $('.jsClanwarsRow'));
        });
        //]]>
    </script>
</header>

<div class="contentNavigation">
    {pages print=true assign=pagesLinks controller="ClanwarsList" link="pageNo=%d&sortField=$sortField&sortOrder=$sortOrder"}

    <nav>
        <ul>
            <li><a href="{link controller='ClanwarsAdd'}{/link}" class="button"><span class="icon icon16 icon-plus"></span> <span>{lang}wcf.acp.clanwars.add{/lang}</span></a></li>

            {event name='contentNavigationButtonsTop'}
        </ul>
    </nav>
</div>

{if $objects|count}
    <div class="tabularBox tabularBoxTitle marginTop">
        <header>
            <h2>{lang}wcf.acp.clanwars.list{/lang} <span class="badge badgeInverse">{#$items}</span></h2>
        </header>

        <table class="table">
            <thead>
            <tr>
                <th class="columnID columnClanwarID{if $sortField == 'clanwarID'} active {@$sortOrder}{/if}" colspan="2"><a href="{link controller='ClanwarsList'}pageNo={@$pageNo}&sortField=clanwarID&sortOrder={if $sortField == 'clanwarID' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.global.objectID{/lang}</a></th>
                <th class="columnText columnGame{if $sortField == 'game'} active {@$sortOrder}{/if}" width="45"><a href="{link controller='ClanwarsList'}pageNo={@$pageNo}&sortField=game&sortOrder={if $sortField == 'game' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.clanwars.game{/lang}</a></th>
                <th class="columnText columnPlatform{if $sortField == 'platform'} active {@$sortOrder}{/if}" width="50"><a href="{link controller='ClanwarsList'}pageNo={@$pageNo}&sortField=platform&sortOrder={if $sortField == 'platform' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.clanwars.platform{/lang}</a></th>
                <th class="columnTitle columnStatus{if $sortField == 'status'} active {@$sortOrder}{/if}"><a href="{link controller='ClanwarsList'}pageNo={@$pageNo}&sortField=status&sortOrder={if $sortField == 'status' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.clanwars.status{/lang}</a></th>
                <th class="columnTitle columnResult">{lang}wcf.acp.clanwars.result{/lang}</th>
                <th class="columDate columnTime{if $sortField == 'time'} active {@$sortOrder}{/if}"><a href="{link controller='ClanwarsList'}pageNo={@$pageNo}&sortField=time&sortOrder={if $sortField == 'status' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.clanwars.time{/lang}</a></th>
                <th class="columnText columnClanname{if $sortField == 'clanname'} active {@$sortOrder}{/if}"><a href="{link controller='ClanwarsList'}pageNo={@$pageNo}&sortField=clanname&sortOrder={if $sortField == 'clanname' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.clanwars.clanname{/lang}</a></th>
                <th class="columnText columnClantag{if $sortField == 'clantag'} active {@$sortOrder}{/if}"><a href="{link controller='ClanwarsList'}pageNo={@$pageNo}&sortField=clantag&sortOrder={if $sortField == 'clantag' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.clanwars.clantag{/lang}</a></th>
                <th class="columnText columnGametype{if $sortField == 'gametype'} active {@$sortOrder}{/if}"><a href="{link controller='ClanwarsList'}pageNo={@$pageNo}&sortField=gametype&sortOrder={if $sortField == 'gametype' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.clanwars.gametype{/lang}</a></th>
                <th class="columnTitle columnNotes">{lang}wcf.acp.clanwars.notes{/lang}</th>

                {event name='columnHeads'}
            </tr>
            </thead>

            <tbody>
            {foreach from=$objects item=cw}
                <tr class="jsClanwarsRow">
                    <td class="columnIcon">
                        <span class="icon icon16 icon-check{if $cw->active == false}-empty{/if} jsToggleButton jsTooltip pointer" title="{lang}wcf.global.button.{if $cw->active == false}enable{else}disable{/if}{/lang}" data-object-id="{@$cw->clanwarID}" data-disable-message="{lang}wcf.global.button.disable{/lang}" data-enable-message="{lang}wcf.global.button.enable{/lang}"></span>
                        <a href="{link controller='ClanwarsEdit' id=$cw->clanwarID}{/link}" title="{lang}wcf.global.button.edit{/lang}" class="jsTooltip"><span class="icon icon16 icon-pencil"></span></a>
                        <span class="icon icon16 icon-remove jsDeleteButton jsTooltip pointer" title="{lang}wcf.global.button.delete{/lang}" data-object-id="{@$cw->clanwarID}" data-confirm-message="{lang}wcf.acp.clanwars.delete{/lang}"></span>

                        {event name='rowButtons'}
                    </td>
                    <td class="clanwarID">{@$cw->clanwarID}</td>
                    <td style="text-align:center;" class="columnText columnGame">{if $cw->game == "bf4"}<img src="{$__wcf->getPath()}images/clanwars/bf4.gif" alt="BF4">{elseif $cw->game == "bfh"}<img src="{$__wcf->getPath()}images/clanwars/bfh.png" alt="BFH">{elseif $cw->game == "ro2"}<img src="{$__wcf->getPath()}images/clanwars/ro2.png" alt="RO2">{elseif $cw->game == "rl"}<img src="{$__wcf->getPath()}images/clanwars/rl.png" alt="RL">{else}<img src="{$__wcf->getPath()}images/clanwars/cs.gif" alt="CS:GO">{/if}</td>
                    <td style="text-align:center;" class="columnText columnPlatform">{if $cw->platform == "ps3"}<img src="{$__wcf->getPath()}images/clanwars/ps3.png" alt="PS3">{elseif $cw->platform == "ps4"}<img src="{$__wcf->getPath()}images/clanwars/ps4.png" alt="PS4">{else}<img src="{$__wcf->getPath()}images/clanwars/pc.png" alt="PC">{/if}</td>
                    <td class="columnTitle columnStatus">{if $cw->status == "1"}<span style="color:#008000;">{lang}wcf.clanwars.won{/lang}</span>{elseif $cw->status == "x"}<span style="color:#D5C400;">{lang}wcf.clanwars.draw{/lang}</span>{else}<span style="color:#f00;">{lang}wcf.clanwars.loss{/lang}</span>{/if}</td>
                    <td class="columnTitle columnResult"><span style="color: {if $cw->result_h > $cw->result_g}#008000{elseif $cw->result_h == $cw->result_g}#D5C400{else}#F00{/if}">{$cw->result_h} : {$cw->result_g}</span></td>
                    <td class="columnText columnTime">{@$cw->time|time}</td>
                    <td class="columnText columnClanname">{$cw->clanname}</td>
                    <td class="columnText columnClantag">{$cw->clantag}</td>
                    <td class="columnText columnGametype">{$cw->gametype}</td>
                    <td class="columnText columnNotes">{$cw->notes}</td>

                    {event name='columns'}
                </tr>
            {/foreach}
            </tbody>
        </table>

    </div>

    <div class="contentNavigation">
        {@$pagesLinks}

        <nav>
            <ul>
                {event name='contentNavigationButtonsBottom'}
            </ul>
        </nav>
    </div>
{else}
    <p class="info">{lang}wcf.global.noItems{/lang}</p>
{/if}

{include file='footer'}
