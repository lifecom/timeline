{assign var="noSidebar" value=true}
{include file='header.tpl'}



{include file='actions/ActionProfile/profile_top.tpl'}
{include file='menu.profile_favourite.tpl'}

{if $oUserCurrent and $oUserCurrent->getId()==$oUserProfile->getId()}
	{$aBlockParams.user=$oUserProfile}
	{insert name="block" block=tagsFavouriteTopic params=$aBlock.params}
{/if}

{if {cfg name='theme.topics.profile'} == 'timeline'}
	{include file='topic_list_timeline.tpl'}
{/if}

{if {cfg name='theme.topics.profile'} == 'metro' || {cfg name='theme.topic.type'} == 'bigpicture'}
	{include file='topic_list_metro.tpl'}
{/if}

{include file='footer.tpl'}