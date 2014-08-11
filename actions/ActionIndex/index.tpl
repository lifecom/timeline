{if $oUserCurrent}
	{include file='header.tpl' menu='blog' menu_content='blog'}
	{include file='topic_list.tpl'}
	{include file='footer.tpl'}
{else if {cfg name='theme.close.mainpage'} == 'yes'}
	{include file='actions/ActionLogin/index.tpl'}
{else}
	{include file='header.tpl' menu='blog' menu_content='blog'}
	{include file='topic_list.tpl'}
	{include file='footer.tpl'}
{/if}