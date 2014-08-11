{hook run='profile_top_begin' oUserProfile=$oUserProfile}

<div class="pofile-bg">

{hook run='profile_sidebar_begin' oUserProfile=$oUserProfile}

	<div class="profile-photo-wrapper">
		<a id="brand" href="{$oUserProfile->getUserWebPath()}"><div class="dots"></div></a>
	</div>

{hook run='profile_sidebar_menu_before' oUserProfile=$oUserProfile}

<ul class="profile-actions" id="profile_actions">

		<li class="username">
			<h2 class="user-login word-wrap {if !$oUserProfile->getProfileName()}no-user-name{/if}" itemprop="nickname">

			{if $oUserProfile->getProfileName()}
			<p class="user-name" itemprop="name">{$oUserProfile->getProfileName()|escape:'html'}
			<span title="{if $oUserProfile->isOnline()}{$aLang.user_status_online}{else}{$aLang.user_status_offline}{/if}" class="js-infobox circle-status {if $oUserProfile->isOnline()}ion-loading-c{else}{/if}"></span><br>
			{/if}


			{if $oUserProfile->getProfileName()}<span>@{/if}
				{$oUserProfile->getLogin()}
			{if $oUserProfile->getProfileName()}</span>{/if}
			{if $oUserProfile->getProfileName()}{else}
			<span title="{if $oUserProfile->isOnline()}{$aLang.user_status_online}{else}{$aLang.user_status_offline}{/if}" class="js-infobox circle-status {if $oUserProfile->isOnline()}ion-loading-c{else}{/if}"></span>{/if}

			</p>
			</h2>
		<li>
<li class="mobile-nav">
<ul>
	{if $oUserCurrent && $oUserCurrent->getId()!=$oUserProfile->getId()}
		<script type="text/javascript">
			jQuery(function($){
				ls.lang.load({lang_load name="profile_user_unfollow,profile_user_follow"});
			});
		</script>

	{include file='actions/ActionProfile/friend_item.tpl' oUserFriend=$oUserProfile->getUserFriend()}
		<li><a class="button button-small" href="{router page='talk'}add/?talk_users={$oUserProfile->getLogin()}"><i class="ion-forward"></i> {$aLang.user_write_prvmsg}</a></li>					
		<li class="fol"><a class="button button-small" href="#" onclick="ls.user.followToggle(this, {$oUserProfile->getId()}); return false;" class="{if $oUserProfile->isFollow()}followed{/if}"><i class="ion-social-rss"></i> {if $oUserProfile->isFollow()}{$aLang.profile_user_unfollow}{else}{$aLang.profile_user_follow}{/if}</a></li>
	{/if}
			
	{if $oUserCurrent and $oUserCurrent->getId() == $oUserProfile->getId()}

		<li {if $sAction=='talk'}class="active"{/if}><a class="button button-small" href="{router page='talk'}"><i class="ion-forward"></i> {$aLang.talk_menu_inbox}{if $iUserCurrentCountTalkNew} ({$iUserCurrentCountTalkNew}){/if}</a></li>
		<li {if $sAction=='settings'}class="active"{/if}><a class="button button-small" href="{router page='settings'}"><i class="ion-wrench"></i> {$aLang.settings_menu}</a></li>

	{/if}
</ul>
</li>

<li>
	<div class="vote-profile">
		<div
			id="vote_area_user_{$oUserProfile->getId()}" class="vote-topic {if $oUserProfile->getRating() > 0} vote-count-positive {elseif $oUserProfile->getRating() < 0} vote-count-negative {elseif $oUserProfile->getRating() == 0} vote-count-zero {/if} {if $oVote} voted {if $oVote->getDirection() > 0} voted-up {elseif $oVote->getDirection() < 0} voted-down {/if} {else} not-voted {/if} {if ($oUserCurrent && $oUserProfile->getId() == $oUserCurrent->getId()) || !$oUserCurrent} vote-nobuttons {/if}">

			<div class="vote-item vote-down" onclick="return ls.vote.vote({$oUserProfile->getId()},this,-1,'user');"><span><i></i></span></div>

			<div class="vote-item vote-count" title="{$aLang.user_vote_count}: {$oUserProfile->getCountVote()}"> <span id="vote_total_user_{$oUserProfile->getId()}">{if $oUserProfile->getRating() > 0}+{/if}{$oUserProfile->getRating()}</span></div>

			<div class="vote-item vote-up" onclick="return ls.vote.vote({$oUserProfile->getId()},this,1,'user');"><span><i></i></span></div>
		</div>

		<div class="vote-label">{$aLang.user_rating}</div>
	</div>

	<div class="strength"><div class="count" id="user_skill_{$oUserProfile->getId()}">{$oUserProfile->getSkill()}</div><div class="vote-label">{$aLang.user_skill}</div></div>
</li>

</ul>

{hook run='profile_sidebar_end' oUserProfile=$oUserProfile}
</div>

<div class="pofile-nav">
	<ul class="nav nav-pills">
		<li class="avatar"><a href="{$oUserProfile->getUserWebPath()}" class="avatar"><img src="{$oUserProfile->getProfileAvatarPath(100)}" alt="avatar" itemprop="photo" /></a></li>
		{hook run='profile_sidebar_menu_item_first' oUserProfile=$oUserProfile}
		<li {if $sAction=='profile' && ($aParams[0]=='whois' or $aParams[0]=='')}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}">{$aLang.user_menu_profile_whois}</a></li>
		<li {if $sAction=='profile' && $aParams[0]=='wall'}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}wall/">{$aLang.user_menu_profile_wall}{if ($iCountWallUser)>0} ({$iCountWallUser}){/if}</a></li>
		<li {if $sAction=='profile' && $aParams[0]=='created'}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}created/topics/">{$aLang.user_menu_publication}{if ($iCountCreated)>0} ({$iCountCreated}){/if}</a></li>
		<li {if $sAction=='profile' && $aParams[0]=='favourites'}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}favourites/topics/">{$aLang.user_menu_profile_favourites}{if ($iCountFavourite)>0} ({$iCountFavourite}){/if}</a></li>
		<li {if $sAction=='profile' && $aParams[0]=='friends'}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}friends/">{$aLang.user_menu_profile_friends}{if ($iCountFriendsUser)>0} ({$iCountFriendsUser}){/if}</a></li>
		<li {if $sAction=='profile' && $aParams[0]=='stream'}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}stream/">{$aLang.user_menu_profile_stream}</a></li>
		{hook run='profile_sidebar_menu_item_last' oUserProfile=$oUserProfile}
	</ul>
</div>

{hook run='profile_top_end' oUserProfile=$oUserProfile}