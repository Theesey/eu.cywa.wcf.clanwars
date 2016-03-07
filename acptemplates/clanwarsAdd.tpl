{include file='header' pageTitle='wcf.acp.clanwars.'|concat:$action}

<header class="boxHeadline">
    <h1>{lang}wcf.acp.clanwars.{$action}{/lang}</h1>
</header>

{include file='formError'}

{if $success|isset}
    <p class="success">{lang}wcf.global.success.{$action}{/lang}</p>
{/if}

<div class="contentNavigation">
    <nav>
        <ul>
            <li><a href="{link controller='ClanwarsList'}{/link}" class="button"><span class="icon icon16 icon-list"></span> <span>{lang}wcf.acp.menu.link.community.clanwars.list{/lang}</span></a></li>

            {event name='contentNavigationButtons'}
        </ul>
    </nav>
</div>

<form method="post" action="{if $action == 'add'}{link controller='ClanwarsAdd'}{/link}{else}{link controller='ClanwarsEdit' id=$cw->clanwarID}{/link}{/if}">
    <div class="container containerPadding marginTop">
        <fieldset>
            <legend>{lang}wcf.global.form.data{/lang}</legend>

            <dl{if $errorField == 'game'} class="formError"{/if}>
                <dt><label for="game">{lang}wcf.acp.clanwars.game{/lang}</label></dt>
                <dd>
                    <select name="game" id="game" required="required">
                        <option value="bf4">{lang}wcf.acp.clanwars.game.bf4{/lang}</option>
                        <option value="bfh">{lang}wcf.acp.clanwars.game.bfh{/lang}</option>
                        <option value="csgo">{lang}wcf.acp.clanwars.game.csgo{/lang}</option>
                    </select>
                    {if $errorField == 'game'}
                        <small class="innerError">{lang}wcf.acp.clanwars.game.error.{$errorType}{/lang}</small>
                    {/if}
                </dd>
            </dl>
            <dl{if $errorField == 'platform'} class="formError"{/if}>
                <dt><label for="platform">{lang}wcf.acp.clanwars.platform{/lang}</label></dt>
                <dd>
                    <select name="platform" id="platform" required="required">
                        <option value="ps3">{lang}wcf.acp.clanwars.platform.ps3{/lang}</option>
                        <option value="ps4">{lang}wcf.acp.clanwars.platform.ps4{/lang}</option>
                        <option value="pc">{lang}wcf.acp.clanwars.platform.pc{/lang}</option>
                    </select>
                    {if $errorField == 'platform'}
                        <small class="innerError">{lang}wcf.acp.clanwars.platform.error.{$errorType}{/lang}</small>
                    {/if}
                </dd>
            </dl>
            <dl{if $errorField == 'time'} class="formError"{/if}>
                <dt><label for="time">{lang}wcf.acp.clanwars.time{/lang}</label></dt>
                <dd>
                    <input name="time" id="time" type="datetime" required="required" value="{$time}">
                    {if $errorField == 'time'}
                        <small class="innerError">{lang}wcf.acp.clanwars.time.error.{$errorType}{/lang}</small>
                    {/if}
                </dd>
            </dl>
            <dl{if $errorField == 'result'} class="formError"{/if}>
                <dt><label for="result">{lang}wcf.acp.clanwars.result{/lang}</label></dt>
                <dd>
                    <input type="text" id="result_h" name="result_h" size="3" value="{$result_h}" class="" required="required" /> <span>:</span> <input type="text" id="result_g" name="result_g" size="3" value="{$result_g}" class="" required="required" /> <span>(Heim : Gast)</span>
                    {if $errorField == 'result_h' || $errorField == 'result_g'}
                        <small class="innerError">{lang}wcf.acp.clanwars.result.error.{$errorType}{/lang}</small>
                    {elseif $errorField == 'result_g'}
                    <small class="innerError">{lang}wcf.acp.clanwars.result.error.{$errorType}{/lang}</small>
                    {/if}
                </dd>
            </dl>
            <dl{if $errorField == 'clanname'} class="formError"{/if}>
                <dt><label for="clanname">{lang}wcf.acp.clanwars.clanname{/lang}</label></dt>
                <dd>
                    <input type="text" id="clanname" name="clanname" value="{$clanname}" class="" required="required" />
                    {if $errorField == 'clanname'}
                        <small class="innerError">{lang}wcf.acp.clanwars.clanname.error.{$errorType}{/lang}</small>
                    {/if}
                </dd>
            </dl>
            <dl{if $errorField == 'clantag'} class="formError"{/if}>
                <dt><label for="clantag">{lang}wcf.acp.clanwars.clantag{/lang}</label></dt>
                <dd>
                    <input type="text" id="clantag" name="clantag" value="{$clantag}" class="" required="required" />
                    {if $errorField == 'clantag'}
                        <small class="innerError">{lang}wcf.acp.clanwars.clantag.error.{$errorType}{/lang}</small>
                    {/if}
                </dd>
            </dl>
            <dl{if $errorField == 'clanlink'} class="formError"{/if}>
                <dt><label for="clanlink">{lang}wcf.acp.clanwars.clanlink{/lang}</label></dt>
                <dd>
                    <input type="text" id="clanlink" name="clanlink" value="{$clanlink}" class="" required="" />
                    {if $errorField == 'clanlink'}
                        <small class="innerError">{lang}wcf.acp.clanwars.clanlink.error.{$errorType}{/lang}</small>
                    {/if}
                </dd>
            </dl>
            <dl{if $errorField == 'gametype'} class="formError"{/if}>
                <dt><label for="gametype">{lang}wcf.acp.clanwars.gametype{/lang}</label></dt>
                <dd>
                    <input type="text" id="gametype" name="gametype" value="{$gametype}" class="" required="required" />
                    {if $errorField == 'gametype'}
                        <small class="innerError">{lang}wcf.acp.clanwars.gametype.error.{$errorType}{/lang}</small>
                    {/if}
                </dd>
            </dl>
            <dl{if $errorField == 'xonx'} class="formError"{/if}>
                <dt><label for="xonx">{lang}wcf.acp.clanwars.xonx{/lang}</label></dt>
                <dd>
                    <select name="xonx" id="xonx" required="">
                        <option value="2vs2">{lang}wcf.acp.clanwars.xonx.2on2{/lang}</option>
                        <option value="3vs3">{lang}wcf.acp.clanwars.xonx.3on3{/lang}</option>
                        <option value="4vs4">{lang}wcf.acp.clanwars.xonx.4on4{/lang}</option>
                        <option value="5vs5">{lang}wcf.acp.clanwars.xonx.5on5{/lang}</option>
                        <option value="6vs6">{lang}wcf.acp.clanwars.xonx.6on6{/lang}</option>
                        <option value="7vs7">{lang}wcf.acp.clanwars.xonx.7on7{/lang}</option>
                        <option value="8vs8">{lang}wcf.acp.clanwars.xonx.8on8{/lang}</option>
                        <option value="9vs9">{lang}wcf.acp.clanwars.xonx.9on9{/lang}</option>
                        <option value="10vs10">{lang}wcf.acp.clanwars.xonx.10on10{/lang}</option>
                        <option value="11vs11">{lang}wcf.acp.clanwars.xonx.11on11{/lang}</option>
                        <option value="12vs12">{lang}wcf.acp.clanwars.xonx.12on12{/lang}</option>
                    </select>
                    {if $errorField == 'xonx'}
                        <small class="innerError">{lang}wcf.acp.clanwars.xonx.error.{$errorType}{/lang}</small>
                    {/if}
                </dd>
            </dl>
            <dl{if $errorField == 'league'} class="formError"{/if}>
                <dt><label for="league">{lang}wcf.acp.clanwars.league{/lang}</label></dt>
                <dd>
                    <input type="text" id="league" name="league" value="{$league}" class="" required="required"/>
                    {if $errorField == 'league'}
                        <small class="innerError">{lang}wcf.acp.clanwars.league.error.{$errorType}{/lang}</small>
                    {/if}
                </dd>
            </dl>
            <dl{if $errorField == 'maps'} class="formError"{/if}>
                <dt><label for="maps">{lang}wcf.acp.clanwars.maps{/lang}</label></dt>
                <dd>
                    <input type="text" id="maps" name="maps" value="{$maps}" class="" required="required"/>
                    {if $errorField == 'maps'}
                        <small class="innerError">{lang}wcf.acp.clanwars.maps.error.{$errorType}{/lang}</small>
                    {/if}
                </dd>
            </dl>
            <dl{if $errorField == 'notes'} class="formError"{/if}>
                <dt><label for="notes">{lang}wcf.acp.clanwars.notes{/lang}</label></dt>
                <dd>
                    <textarea id="notes" name="notes">{$notes}</textarea>
                    {if $errorField == 'notes'}
                        <small class="innerError">{lang}wcf.acp.clanwars.notes.error.{$errorType}{/lang}</small>
                    {/if}
                </dd>
            </dl>

            {event name='dataFields'}
        </fieldset>

    </div>

    <div class="formSubmit">
        <input type="submit" value="{lang}wcf.global.button.submit{/lang}" accesskey="s" />
        {@SECURITY_TOKEN_INPUT_TAG}
    </div>
</form>

{include file='footer'}
