{if {cfg name='theme.sidebar.people'} == 'no'}
{if $aCityList && count($aCityList)>0}
	<section class="block city">
		<header class="block-header">
			<h3>{$aLang.block_city_tags}</h3>
		</header>
		

		<div class="block-content">
			<i title="{$aLang.block_city_tags}" class="ion-location"></i>
			<ul class="tag-cloud word-wrap">
				{foreach from=$aCityList item=oCity}
					<li><a class="tag-size-{$oCity->getSize()}" href="{router page='people'}city/{$oCity->getId()}/">{$oCity->getName()|escape:'html'}</a></li>
				{/foreach}					
			</ul>	
		</div>		
	</section>
{/if}
{else}
{if $aCityList && count($aCityList)>0}
	<section class="block">
		<header class="block-header">
			<h3>{$aLang.block_city_tags}</h3>
		</header>
		
		
		<div class="block-content">
			<ul class="tag-cloud word-wrap">
				{foreach from=$aCityList item=oCity}
					<li><a class="tag-size-{$oCity->getSize()}" href="{router page='people'}city/{$oCity->getId()}/">{$oCity->getName()|escape:'html'}</a></li>
				{/foreach}					
			</ul>	
		</div>		
	</section>
{/if}
{/if}