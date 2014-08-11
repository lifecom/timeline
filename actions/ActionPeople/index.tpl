{include file='header.tpl'}

<h2 class="page-header">{$aLang.people}</h2>

{include file='menu.people.tpl'}

<form action="" method="POST" id="form-users-search" onsubmit="return false;" class="search-item search-item-abc">
	<div class="search-input-wrapper">
		<input id="search-user-login" type="text" placeholder="{$aLang.user_search_title_hint}" autocomplete="off" name="user_login" value="" class="input-text" onkeyup="ls.timer.run(ls.user.searchUsers,'users_search',['form-users-search'],1000);">
		<div class="input-submit" onclick="jQuery('#form-users-search').submit()"></div>
	</div>
	
	<ul id="user-prefix-filter" class="search-abc">
		<li class="active"><a href="#" onclick="return ls.user.searchUsersByPrefix('',this);"><span>{$aLang.user_search_filter_all}</span></a></li>
		{foreach from=$aPrefixUser item=sPrefixUser}
			<li><a href="#" onclick="return ls.user.searchUsersByPrefix('{$sPrefixUser}',this);"><span>{$sPrefixUser}</span></a></li>
		{/foreach}
	</ul>
</form>

<div id="users-list-search" style="display:none;"></div>
{if $sAction=='people' and {cfg name='theme.sidebar.people'} == 'no'}

	<!-- people-widgets -->
	<div class="people-widgets">
		{hook run='people_sidebar_begin'}
		<section class="block users">
			<header class="block-header">
				<h3>{$aLang.user_stats}</h3>
			</header>


			<div class="block-content">
				<i title="{$aLang.user_stats}" class="ion-stats-bars"></i>
				<ul>
					<li>{$aLang.user_stats_all}: <strong>{$aStat.count_all}</strong></li>
					<li>{$aLang.user_stats_active}: <strong>{$aStat.count_active}</strong></li>
					<li>{$aLang.user_stats_noactive}: <strong>{$aStat.count_inactive}</strong></li>
				</ul>
				
				<ul>
					<li>{$aLang.user_stats_sex_man}: <strong>{$aStat.count_sex_man}</strong></li>
					<li>{$aLang.user_stats_sex_woman}: <strong>{$aStat.count_sex_woman}</strong></li>
					<li>{$aLang.user_stats_sex_other}: <strong>{$aStat.count_sex_other}</strong></li>
				</ul>
			</div>
		</section>
		{insert name="block" block='tagsCountry'}
		{insert name="block" block='tagsCity'}
	</div>

{/if}

<div id="users-list-search" style="display:none;"></div>

<div id="users-list-original">
	{router page='people' assign=sUsersRootPage}
	{include file='user_list.tpl' aUsersList=$aUsersRating bUsersUseOrder=true sUsersRootPage=$sUsersRootPage}
</div>

{include file='footer.tpl'}