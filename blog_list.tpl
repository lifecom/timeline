<table class="table table-blogs">
	{if $bBlogsUseOrder}
		<thead>
			<tr>
				<th class="cell-info">&nbsp;</th>
				<th class="cell-name cell-tab">
					<div class="cell-tab-inner {if $sBlogOrder=='blog_title'}active{/if}"><a href="{$sBlogsRootPage}?order=blog_title&order_way={if $sBlogOrder=='blog_title'}{$sBlogOrderWayNext}{else}{$sBlogOrderWay}{/if}" {if $sBlogOrder=='blog_title'}class="{$sBlogOrderWay}"{/if}><span>{$aLang.blogs_title}</span></a></div>
				</th>

				{if $oUserCurrent}
					<th class="cell-join">&nbsp;</th>
				{/if}

				<th class="cell-readers cell-tab">
					<div class="cell-tab-inner {if $sBlogOrder=='blog_count_user'}active{/if}"><a href="{$sBlogsRootPage}?order=blog_count_user&order_way={if $sBlogOrder=='blog_count_user'}{$sBlogOrderWayNext}{else}{$sBlogOrderWay}{/if}" {if $sBlogOrder=='blog_count_user'}class="{$sBlogOrderWay}"{/if}><span>{$aLang.blogs_readers}</span></a></div>
				</th>
				<th class="cell-rating cell-tab align-center">
					<div class="cell-tab-inner {if $sBlogOrder=='blog_rating'}active{/if}"><a href="{$sBlogsRootPage}?order=blog_rating&order_way={if $sBlogOrder=='blog_rating'}{$sBlogOrderWayNext}{else}{$sBlogOrderWay}{/if}" {if $sBlogOrder=='blog_rating'}class="{$sBlogOrderWay}"{/if}><span>{$aLang.blogs_rating}</span></a></div>
				</th>
			</tr>
		</thead>
	{else}
		<thead>
			<tr>
				<th class="cell-info">&nbsp;</th>
				<th class="cell-name cell-tab"><div class="cell-tab-inner"><span>{$aLang.blogs_title}</span></div></th>

				{if $oUserCurrent}
					<th class="cell-join">&nbsp;</th>
				{/if}

				<th class="cell-readers cell-tab"><div class="cell-tab-inner"><span>{$aLang.blogs_readers}</span></div></th>
				<th class="cell-rating cell-tab align-center">
					<div class="cell-tab-inner active"><span>{$aLang.blogs_rating}</span></div>
				</th>
			</tr>
		</thead>
	{/if}
</table>



<div class="blogs-item-container">


		{if $aBlogs}
			{foreach from=$aBlogs item=oBlog}
				{assign var="oUserOwner" value=$oBlog->getOwner()}	
	<div class="list-items">
	<div class="list-item-block">


<div class="list-item-blog">
	<img src="{cfg name='path.static.skin'}/images/avatar_blog_300x300.png" alt="avatar" style="opacity:0;">
	<a href="{$oBlog->getUrlFull()}" class="top-span">
		<img src="{$oBlog->getAvatarPath(300)}" alt="avatar">
		<div class="dots"></div>
	</a>

	  

	{if $oUserCurrent}
		{if $oUserCurrent->getId() != $oBlog->getOwnerId() and $oBlog->getType() == 'open'}
			<div class="caption"><a class="button" href="#" onclick="ls.blog.toggleJoin(this, {$oBlog->getId()}); return false;">
				{if $oBlog->getUserIsJoin()}
					{$aLang.blog_leave}
				{else}
					{$aLang.blog_join}
				{/if}
			</a></div>
		{else}
			<div class="caption"><a class="button button-primary" href="{$oBlog->getUrlFull()}">{$aLang.blog_view}</a></div>
		{/if}
	
	{else}
		<div class="caption"><a class="button button-primary" href="{$oBlog->getUrlFull()}">{$aLang.blog_view}</a></div>
	{/if}

	<a href="{$oBlog->getUrlFull()}" class="btm-span">
		<img src="{$oBlog->getAvatarPath(300)}" alt="avatar">
		<div class="dots"></div>
	</a>

</div>


	<div class="info">
		<div class="info-header">
			<h3><a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a></h3>
		</div>
					
		<p>{$oBlog->getDescription()|strip_tags|trim|truncate:230:'...'}</p>
					
	</div>
					
	<div title="{$aLang.blog_info}" class="js-infobox info-item in">
		<i class="ion-information" onclick="return ls.infobox.showInfoBlog(this,{$oBlog->getId()});"></i>
	</div>
	
	{if $oBlog->getType() == 'close'}		
	<div title="{$aLang.blog_closed}" class="js-infobox info-item type">
		<i class="ion-ios7-locked"></i>
	</div>
	{/if}
						
	<div title="{$aLang.blogs_rating}: {$oBlog->getRating()}" class="js-infobox info-item rating">
		<i class="ion-arrow-graph-up-right"></i>
	</div>
						
	<div title="{$aLang.blogs_readers}: {$oBlog->getCountUser()}" class="js-infobox info-item users">
		<i class="ion-android-friends"></i>
	</div>

	</div>
	</div>
			{/foreach}
		{else}
			<tr>
				<td colspan="3">
					{if $sBlogsEmptyList}
						{$sBlogsEmptyList}
					{else}

					{/if}
				</td>
			</tr>
		{/if}
</div>