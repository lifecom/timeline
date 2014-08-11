{assign var="noSidebar" value=true}
{include file='header.tpl'}
{assign var="oUserOwner" value=$oBlog->getOwner()}
{assign var="oVote" value=$oBlog->getVote()}

<div class="pofile-bg blog-style">

	<div class="profile-photo-wrapper">
		<a id="brand" href="{$oBlog->getUrlFull()}" style=""><div class="dots"></div><!-- $oBlog->getAvatarPath(0) -->
		</a>
	</div>

<ul class="profile-actions" id="profile_actions">

		<li class="username">
			<h2 class="user-login word-wrap">
				<p class="user-name" itemprop="name">
				<a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'} {if $oBlog->getType()=='close'} <i title="{$aLang.blog_closed}" class="js-infobox ion-ios7-locked"></i>{/if}</a>
					<br>
					<span> {$aLang.blogs_owner} — <a href="{$oUserOwner->getUserWebPath()}"><img src="{$oUserOwner->getProfileAvatarPath(24)}" alt="avatar" class="avatar" /></a> <a href="{$oUserOwner->getUserWebPath()}">{$oUserOwner->getLogin()}</a></span>
				</p>
			</h2>
		</li>
<li class="mobile-nav">
<ul>
		<li>
			{if $oUserCurrent and $oUserCurrent->getId()!=$oBlog->getOwnerId()}
			<a href="#" type="submit"  class="button button-small" id="button-blog-join-first-{$oBlog->getId()}" data-button-additional="button-blog-join-second-{$oBlog->getId()}" data-only-text="1" onclick="ls.blog.toggleJoin(this, {$oBlog->getId()}); return false;">{if $oBlog->getUserIsJoin()}<i class="ion-android-book" style="font-size: 80%;"></i> {$aLang.blog_leave}{else}<i class="ion-android-book" style="font-size: 80%;"></i> {$aLang.blog_join}{/if}</a>
			{/if}
		</li>

		<li>
			<a href="#" class="button button-small window-blog-info-show"><i class="ion-information" style="top:0;"></i> {$aLang.blog_expand_info}</a>
		</li>
</ul>
</li>
		<li>
			<div class="vote-profile">

			<div id="vote_area_blog_{$oBlog->getId()}" class="vote-topic {if $oBlog->getRating() > 0} vote-count-positive {elseif $oBlog->getRating() < 0} vote-count-negative {elseif $oBlog->getRating() == 0} vote-count-zero {/if} {if $oVote} voted {if $oVote->getDirection() > 0} voted-up {elseif $oVote->getDirection() < 0} voted-down {/if} {else} not-voted {/if} {if ($oUserCurrent && $oUserOwner->getId() == $oUserCurrent->getId())} vote-nobuttons {/if}">
			<a href="#" class="vote-item vote-down" onclick="return ls.vote.vote({$oBlog->getId()},this,-1,'blog');"><span><i></i></span></a>
				<div class="vote-item vote-count" title="{$aLang.blog_vote_count}: {$oBlog->getCountVote()}"><span id="vote_total_blog_{$oBlog->getId()}">{if $oBlog->getRating() > 0}+{/if}{$oBlog->getRating()}</span></div>
				<a href="#" class="vote-item vote-up" onclick="return ls.vote.vote({$oBlog->getId()},this,1,'blog');"><span><i></i></span></a>
			</div>

			<div class="vote-label">{$aLang.user_rating}</div>

			</div>
		</li>

</ul>

</div>

{include file='window_blog_info.tpl'}

<div class="nav-menu-wrapper">
	<ul class="nav nav-pills">
		<li {if $sMenuSubItemSelect=='good'}class="active"{/if}><a href="{$sMenuSubBlogUrl}">{$aLang.blog_menu_collective_good}</a></li>
		<li {if $sMenuSubItemSelect=='new'}class="active"{/if}><a href="{$sMenuSubBlogUrl}newall/">{$aLang.blog_menu_collective_new}</a>{if $iCountTopicsBlogNew>0} <a href="{$sMenuSubBlogUrl}new/" class="new">+{$iCountTopicsBlogNew}</a>{/if}</li>
		<li {if $sMenuSubItemSelect=='discussed'}class="active"{/if}><a href="{$sMenuSubBlogUrl}discussed/">{$aLang.blog_menu_collective_discussed}</a></li>
		<li {if $sMenuSubItemSelect=='top'}class="active"{/if}><a href="{$sMenuSubBlogUrl}top/">{$aLang.blog_menu_collective_top}</a></li>
		{hook run='menu_blog_blog_item'}
	</ul>

	{if $sPeriodSelectCurrent}
		<ul class="nav nav-pills nav-pills-dropdown">
			<li {if $sPeriodSelectCurrent=='1'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=1">{$aLang.blog_menu_top_period_24h}</a></li>
			<li {if $sPeriodSelectCurrent=='7'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=7">{$aLang.blog_menu_top_period_7d}</a></li>
			<li {if $sPeriodSelectCurrent=='30'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=30">{$aLang.blog_menu_top_period_30d}</a></li>
			<li {if $sPeriodSelectCurrent=='all'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=all">{$aLang.blog_menu_top_period_all}</a></li>
		</ul>
	{/if}
</div>

{if $bCloseBlog}
	{$aLang.blog_close_show}
{else}
	{if {cfg name='theme.topics.profile'} == 'timeline'}
		{include file='topic_list_timeline.tpl'}
	{/if}
	{if {cfg name='theme.topics.profile'} == 'metro' || {cfg name='theme.topics.profile'} == 'bigpicture'}
		{include file='topic_list_metro.tpl'}
	{/if}
{/if}


{include file='footer.tpl'}