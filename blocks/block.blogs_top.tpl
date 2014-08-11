<ul class="block-blog-list">
	{foreach from=$aBlogs item=oBlog}
		<li>
			<a href="{$oBlog->getUrlFull()}">
				<img class="avatar" src="{$oBlog->getAvatarPath(100)}" alt="avatar"/>
				{strip}
					<span>{$oBlog->getTitle()|escape:'html'}</span>
					{if $oBlog->getType()=='close'}<i title="{$aLang.blog_closed}" class="icon-synio-topic-private"></i>{/if}
				{/strip}
				<strong>{$oBlog->getRating()}</strong>
			</a>
		</li>
	{/foreach}
</ul>				