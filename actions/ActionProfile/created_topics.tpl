{assign var="noSidebar" value=true}
{include file='header.tpl'}



{include file='actions/ActionProfile/profile_top.tpl'}
{include file='menu.profile_created.tpl'}

{if {cfg name='theme.topics.profile'} == 'timeline'}
	{include file='topic_list_timeline.tpl'}
{/if}

{if {cfg name='theme.topics.profile'} == 'metro' || {cfg name='theme.topics.profile'} == 'bigpicture'}
	{include file='topic_list_metro.tpl'}
{/if}

{include file='footer.tpl'}