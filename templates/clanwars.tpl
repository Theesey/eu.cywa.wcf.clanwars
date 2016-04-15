{include file='documentHeader'}

<head>
    <title>{lang}wcf.clanwars.headline{/lang} - {PAGE_TITLE|language}</title>

    {include file='headInclude'}
</head>

<body id="tpl{$templateName|ucfirst}">

{hascontent}
{capture assign='sidebar'}
    {content}
        {if $isInstalled == 1}
        <fieldset class="dashboardBoxSidebarButton">
            <div>
                <a href="{link controller='FightUs'}{/link}" class="button">{lang}wcf.clanwars.sidebar.fightUs{/lang}</a>
            </div>
        </fieldset>
        {/if}
        <fieldset class="clanwarsSidebarStatistic">
            <legend>{lang}wcf.clanwars.sidebar.statistic{/lang}</legend>
            <div>
                <dl class="plain dataList">
                    <dt>{lang}wcf.clanwars.sidebar.statistic.total{/lang}</dt>
                        <dd>{$playedClanwars}</dd>
                    <dt>{lang}wcf.clanwars.sidebar.statistic.won{/lang}</dt>
                        <dd><span style="color:#008000;">{$playedClanwarsWon}</span></dd>
                    <dt>{lang}wcf.clanwars.sidebar.statistic.draw{/lang}</dt>
                        <dd><span style="color:#D5C400;">{$playedClanwarsDraw}</span></dd>
                    <dt>{lang}wcf.clanwars.sidebar.statistic.loss{/lang}</dt>
                        <dd><span style="color:#f00;">{$playedClanwarsLoss}</span></dd>
                    <dt>{lang}wcf.clanwars.sidebar.statistic.ratio{/lang}</dt>
                        <dd><span style="color:{if $playedClanwarsRatio > 0}#008000{else}#f00{/if}">{$playedClanwarsRatio}</span></dd>
                </dl>
            </div>
        </fieldset>
    {/content}
{/capture}
{/hascontent}


{include file='header' sidebarOrientation='right'}

<header class="boxHeadline">
    <h1>{lang}wcf.clanwars.headline{/lang}</h1>
</header>

{include file='userNotice'}

<div class="contentNavigation">
    {pages print=true assign=pagesLinks controller='Clanwars' link="&pageNo=%d&sortField=$sortField&sortOrder=$sortOrder"}
</div>

<div class="container marginTop">
    <table class="table">
        <thead>
        <tr>
            <th class="{if $sortField == 'game'} active {@$sortOrder}{/if}" width="45"><a href="{link controller='Clanwars'}pageNo={@$pageNo}&sortField=game&sortOrder={if $sortField == 'game' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.clanwars.game{/lang}</a></th>
            <th class="{if $sortField == 'platform'} active {@$sortOrder}{/if}" width="50"><a href="{link controller='Clanwars'}pageNo={@$pageNo}&sortField=platform&sortOrder={if $sortField == 'platform' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.clanwars.platform{/lang}</a></th>
            <th class="{if $sortField == 'status'} active {@$sortOrder}{/if}"><a href="{link controller='Clanwars'}pageNo={@$pageNo}&sortField=status&sortOrder={if $sortField == 'status' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.clanwars.status{/lang}</a></th>
            <th class="{if $sortField == 'time'} active {@$sortOrder}{/if}"><a href="{link controller='Clanwars'}pageNo={@$pageNo}&sortField=time&sortOrder={if $sortField == 'time' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.clanwars.time{/lang}</a></th>
            <th class="{if $sortField == 'clanname'} active {@$sortOrder}{/if}"><a href="{link controller='Clanwars'}pageNo={@$pageNo}&sortField=clanname&sortOrder={if $sortField == 'clanname' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.clanwars.clanname{/lang}</span></th>
            <th><span>{lang}wcf.clanwars.clantag{/lang}</span></th>
            <th><span>{lang}wcf.clanwars.result{/lang}</span></th>
            <th class="{if $sortField == 'gametype'} active {@$sortOrder}{/if}"><a href="{link controller='Clanwars'}pageNo={@$pageNo}&sortField=gametype&sortOrder={if $sortField == 'gametype' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.clanwars.gametype{/lang}</a></th>
            <th><span>{lang}wcf.clanwars.xonx{/lang}</span></th>
            <th class="{if $sortField == 'league'} active {@$sortOrder}{/if}"><a href="{link controller='Clanwars'}pageNo={@$pageNo}&sortField=league&sortOrder={if $sortField == 'league' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.clanwars.league{/lang}</a></th>
            <th><span>{lang}wcf.clanwars.maps{/lang}</span></th>
        </tr>
        </thead>

        <tbody>
        {foreach from=$objects item=cw}
            {if $cw->active == 1}
            <tr>
                <td style="text-align:center;">{if $cw->game == "bf4"}<img src="{$__wcf->getPath()}images/clanwars/bf4.gif" alt="BF4">{elseif $cw->game == "bfh"}<img src="{$__wcf->getPath()}images/clanwars/bfh.png" alt="BFH">{elseif $cw->game == "ro2"}<img src="{$__wcf->getPath()}images/clanwars/ro2.png" alt="RO2">{else}<img src="{$__wcf->getPath()}images/clanwars/cs.gif" alt="CS:GO">{/if}</td>
                <td style="text-align:center;">{if $cw->platform == "ps3"}<img src="{$__wcf->getPath()}images/clanwars/ps3.png" alt="PS3">{elseif $cw->platform == "ps4"}<img src="{$__wcf->getPath()}images/clanwars/ps4.png" alt="PS4">{else}<img src="{$__wcf->getPath()}images/clanwars/pc.png" alt="PC">{/if}</td>
                <td>{if $cw->status == "1"}<span style="color:#008000;">Gewonnen</span>{elseif $cw->status == "x"}<span style="color:#D5C400;">Unentschieden</span>{else}<span style="color:#f00;">Verloren</span>{/if}</td>
                <td>{@$cw->time|time}</td>
                <td>{if $cw->clanlink}<a href="{$cw->clanlink}" title="{$cw->clanname}">{$cw->clanname}</a>{else}{$cw->clanname}{/if}</td>
                <td>{$cw->clantag}</td>
                <td><span style="color: {if $cw->result_h > $cw->result_g}#008000{elseif $cw->result_h == $cw->result_g}#D5C400{else}#F00{/if}">{$cw->result_h}:{$cw->result_g}</span></td>
                <td>{$cw->gametype}</td>
                <td>{$cw->xonx}</td>
                <td>{$cw->league}</td>
                <td>{$cw->maps}</td>
            </tr>
            {/if}
        {/foreach}
        </tbody>
    </table>
</div>

<div class="contentNavigation">
    {@$pagesLinks}
</div>

{include file='footer'}

</body>
</html>