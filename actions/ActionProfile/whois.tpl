{assign var="sMenuItemSelect" value='profile'}
{include file='header.tpl'}

{assign var="oSession" value=$oUserProfile->getSession()}
{assign var="oVote" value=$oUserProfile->getVote()}
{assign var="oGeoTarget" value=$oUserProfile->getGeoTarget()}

{include file='actions/ActionProfile/profile_top.tpl'}

<div id="profile-blocks">

<div class="profile-block about">
<div class="profile-block-content">

			<h2 class="header-table"><span>{$aLang.profile_about}</span></h2>

			{if $oUserProfile->getProfileAbout()}	
				<p>{$oUserProfile->getProfileAbout()}</p>
			{else}
				<p>{$aLang.profile_about_empty}</p>
			{/if}
			<br />
			{if $oUserCurrent and $oUserCurrent->getId() == $oUserProfile->getId()}
				<a href="{router page='settings'}" class="edit">{$aLang.profile_about_edit}</a>
			{/if}
</div>
</div>
	
		{assign var="aUserFieldValues" value=$oUserProfile->getUserFieldValues(true,array(''))}

		{if $oUserProfile->getProfileSex()!='other' || $oUserProfile->getProfileBirthday() || $oGeoTarget || $oUserProfile->getProfileAbout() || count($aUserFieldValues)}
<div class="profile-block profile-list-about">
<div class="profile-block-content" style="min-height: 140px;">

			<i class="info-icon"></i>

			<h2 class="header-table"><span>{$aLang.profile_privat}</span></h2>
			
			<ul class="">		
				{if $oUserProfile->getProfileSex()!='other'}
					<li>
						<span>{$aLang.profile_sex}:</span>
						<strong>
							{if $oUserProfile->getProfileSex()=='man'}
								{$aLang.profile_sex_man}
							{else}
								{$aLang.profile_sex_woman}
							{/if}
						</strong>
					</li>
				{/if}

					
					
				{if $oUserProfile->getProfileBirthday()}
					<li>
						<span>{$aLang.profile_birthday}:</span>
						<strong>{date_format date=$oUserProfile->getProfileBirthday() format="j F Y"}</strong>
					</li>
				{/if}
				
				
				{if $oGeoTarget}
					<li>
						<span>{$aLang.profile_place}:</span>
						<strong itemprop="address" itemscope itemtype="http://data-vocabulary.org/Address">
							{if $oGeoTarget->getCountryId()}
								<a href="{router page='people'}country/{$oGeoTarget->getCountryId()}/" itemprop="country-name">{$oUserProfile->getProfileCountry()|escape:'html'}</a>{if $oGeoTarget->getCityId()},{/if}
							{/if}
							
							{if $oGeoTarget->getCityId()}
								<a href="{router page='people'}city/{$oGeoTarget->getCityId()}/" itemprop="locality">{$oUserProfile->getProfileCity()|escape:'html'}</a>
							{/if}
						</strong>
					</li>
				{/if}

				{if $aUserFieldValues}
					{foreach from=$aUserFieldValues item=oField}
						<li>
							<span><i class="fontello icon-{$oField->getName()}"></i> {$oField->getTitle()|escape:'html'}:</span>
							<strong>{$oField->getValue(true,true)}</strong>
						</li>
					{/foreach}
				{/if}

				{hook run='profile_whois_privat_item' oUserProfile=$oUserProfile}
			
			<li>
				<span>{$aLang.profile_date_registration}:</span>
				<strong>{date_format date=$oUserProfile->getDateRegister()}</strong>
			</li>	
			
			
			{if $oSession}				
				<li>
					<span>{$aLang.profile_date_last}:</span>
					<strong>{date_format date=$oSession->getDateLast()}</strong>
				</li>
			{/if}
			</ul>
</div>
</div>
		{/if}

		{hook run='profile_whois_item_after_privat' oUserProfile=$oUserProfile}

		{assign var="aUserFieldContactValues" value=$oUserProfile->getUserFieldValues(true,array('contact'))}
		{if $aUserFieldContactValues}
<div class="profile-block">
<div class="profile-block-content">
			<h2 class="header-table"><span>{$aLang.profile_contacts}</span></h2>
			
			<ul class="profile-contact-list-social">
				{foreach from=$aUserFieldContactValues item=oField}
					<li class="js-infobox hex-icon-{$oField->getName()}" title="{$oField->getName()}"><span>{$oField->getValue(true,true)}</span></li>
				{/foreach}
			</ul>
</div>
</div>
		{/if}

		{assign var="aUserFieldContactValues" value=$oUserProfile->getUserFieldValues(true,array('social'))}
		{if $aUserFieldContactValues}
<div class="profile-block contact-block">
<div class="profile-block-content">
			<h2 class="header-table"><span>{$aLang.profile_social}</span></h2>
			
			<ul class="profile-contact-list-social">
				{foreach from=$aUserFieldContactValues item=oField}
					<li class="js-infobox hex-icon-{$oField->getName()}" title="{$oField->getName()}"><span>{$oField->getValue(true,true)}</span></li>
				{/foreach}
			</ul>
</div>
</div>
		{/if}
		
		{hook run='profile_whois_item' oUserProfile=$oUserProfile}
<!-- <h2 class="header-table">{$aLang.profile_activity}</h2> -->

{if $oConfig->GetValue('general.reg.invite') and $oUserInviteFrom}
<div class="profile-block">
<div class="profile-block-content">
	<h2 class="header-table"><span>{$aLang.profile_invite_from}:</span></h2>
	<strong>							       						
		<a href="{$oUserInviteFrom->getUserWebPath()}">{$oUserInviteFrom->getLogin()}</a>&nbsp;    					
	</strong>
</div>
</div>
{/if}
			
{if $oConfig->GetValue('general.reg.invite') and $aUsersInvite}
<div class="profile-block">
<div class="profile-block-content">
	<h2 class="header-table"><span>{$aLang.profile_invite_to}:</span></h2>
		<strong>
			{foreach from=$aUsersInvite item=oUserInvite}        						
				<a href="{$oUserInvite->getUserWebPath()}">{$oUserInvite->getLogin()}</a>&nbsp; 
			{/foreach}
		</strong>
</div>
</div>
{/if}
			
			
{if $aBlogsOwner}
<div class="profile-block">
<div class="profile-block-content">
	<h2 class="header-table"><span>{$aLang.profile_blogs_self}:</span></h2>
		<strong>
			<ul class="user-list-avatar">
				{foreach from=$aBlogsOwner item=oBlog name=blog_owner}
					<li>
					<a href="{$oBlog->getUrlFull()}">
					<img src="{$oBlog->getAvatarPath(100)}" alt="avatar" class="avatar"/>
					<h4>{$oBlog->getTitle()|escape:'html'}<h4>
					</a>
					</li>
				{/foreach}
			</ul>
		</strong>
</div>
</div>
{/if}
			
			
{if $aBlogAdministrators}
<div class="profile-block">
<div class="profile-block-content">
	<h2 class="header-table"><span>{$aLang.profile_blogs_administration}:</span></h2>
					<strong>
					<ul class="user-list-avatar">
						{foreach from=$aBlogAdministrators item=oBlogUser name=blog_user}
							{assign var="oBlog" value=$oBlogUser->getBlog()}
							<li><a href="{$oBlog->getUrlFull()}"><img src="{$oBlog->getAvatarPath(100)}" alt="avatar" class="avatar"/><h4>{$oBlog->getTitle()|escape:'html'}<h4></a></li>
						{/foreach}
					</ul>
					</strong>
</div>
</div>
{/if}
			
			
{if $aBlogModerators}
<div class="profile-block">
<div class="profile-block-content">
					<h2 class="header-table"><span>{$aLang.profile_blogs_moderation}:</span></h2>
					<strong>
					<ul class="user-list-avatar">
						{foreach from=$aBlogModerators item=oBlogUser name=blog_user}
							{assign var="oBlog" value=$oBlogUser->getBlog()}
							<li><a href="{$oBlog->getUrlFull()}"><img src="{$oBlog->getAvatarPath(100)}" alt="avatar" class="avatar"/><h4>{$oBlog->getTitle()|escape:'html'}<h4></a></li>
						{/foreach}
					</ul>
					</strong>
</div>
</div>
{/if}
			
			
{if $aBlogUsers}
<div class="profile-block">
<div class="profile-block-content">
					<h2 class="header-table"><span>{$aLang.profile_blogs_join}:</span></h2>
					<strong>
					<ul class="user-list-avatar">
						{foreach from=$aBlogUsers item=oBlogUser name=blog_user}
							{assign var="oBlog" value=$oBlogUser->getBlog()}
							<li><a href="{$oBlog->getUrlFull()}"><img src="{$oBlog->getAvatarPath(100)}" alt="avatar" class="avatar"/><h4>{$oBlog->getTitle()|escape:'html'}<h4></a></li>
						{/foreach}
					</ul>
					</strong>
</div>
</div>
{/if}

			
{hook run='profile_whois_activity_item' oUserProfile=$oUserProfile}

{if $aUsersFriend}
<div class="profile-block friends">
<div class="profile-block-content">
	<h2 class="header-table mb-15"><a href="{$oUserProfile->getUserWebPath()}friends/"><span>{$aLang.profile_friends} ({$iCountFriendsUser})</span></a></h2>
			
	{include file='user_list_avatar.tpl' aUsersList=$aUsersFriend}
</div>
</div>
{/if}



{if $oUserCurrent && $oUserCurrent->getId() != $oUserProfile->getId()}
<div class="profile-block">
<div class="profile-block-content">
	<section class="block block-type-profile-note">
		{if $oUserNote}
			<script type="text/javascript">
				ls.usernote.sText = {json var = $oUserNote->getText()};
			</script>
		{/if}

		<div id="usernote-note" class="profile-note" {if !$oUserNote}style="display: none;"{/if}>
			<p id="usernote-note-text">
				{if $oUserNote}
					{$oUserNote->getText()}
				{/if}
			</p>
			
			<ul class="actions">
				<li><a href="#" onclick="return ls.usernote.showForm();" class="link-dotted">{$aLang.user_note_form_edit}</a></li>
				<li><a href="#" onclick="return ls.usernote.remove({$oUserProfile->getId()});" class="link-dotted">{$aLang.user_note_form_delete}</a></li>
			</ul>
		</div>
		
		<div id="usernote-form" style="display: none;">
			<p><textarea rows="4" cols="20" id="usernote-form-text" class="input-text input-width-full"></textarea></p>
			<button type="submit"  onclick="return ls.usernote.save({$oUserProfile->getId()});" class="button button-primary">{$aLang.user_note_form_save}</button>
			<button type="submit"  onclick="return ls.usernote.hideForm();" class="button">{$aLang.user_note_form_cancel}</button>
		</div>
		
		<a href="#" onclick="return ls.usernote.showForm();" id="usernote-button-add" class="link-dotted" {if $oUserNote}style="display:none;"{/if}>{$aLang.user_note_add}</a>
	</section>
</div>
</div>
{/if}

{hook run='profile_whois_item_end' oUserProfile=$oUserProfile}

</div>

{include file='menu.profile_whois.tpl'}

<style>
	.nav-pills.nav-pills-profile {
		display: none;
	}
</style>

<script type="text/javascript">
  $(window).load(function(){ 
    $('#profile-blocks').masonry({
      itemSelector: '.profile-block',
          singleMode: true,
      isResizable: true,
      isAnimated: true,
          animationOptions: { 
          queue: true, 
          duration: 500 
      }
    }); 
  });
</script>

{include file='footer.tpl'}