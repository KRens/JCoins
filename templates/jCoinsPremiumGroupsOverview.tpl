{include file='documentHeader'}

<head>
	<title>{lang}wcf.jcoins.premiumgroups.title{/lang} - {PAGE_TITLE|language}</title>

	{include file='headInclude'}
	<script data-relocate="true" type="text/javascript" src="{@$__wcf->getPath()}js/WCF.JCoins{if !ENABLE_DEBUG_MODE}.min{/if}.js"></script>
        <script data-relocate="true" type="text/javascript">
		//<![CDATA[
		$(function() {
			new WCF.JCoins.Premium.Buy($('.jCoinsPremiumList > li'));
		});
		//]]>
        </script>
</head>

<body id="tpl{$templateName|ucfirst}">
	{include file='header'}

	<header class="boxHeadline">
		<hgroup>
			<h1>{lang}wcf.jcoins.premiumgroups.title{/lang}</h1>
		</hgroup>
	</header>

	{include file='userNotice'}

	{hascontent}
	<div class="container containerPadding marginTop shadow">
		{content}
		{foreach from=$premiumGroups item=premiumGroup}
			<fieldset>
				<legend>{$premiumGroup.groupName}{if $premiumGroup.isMember} <span class="badge green">{lang}wcf.jcoins.premiumgroups.active{/lang}</span> <small>({lang}wcf.jcoins.premiumgroups.until{/lang})</small>{/if}</legend>
				<div class="container">
					<ol class="containerList doubleColumned jCoinsPremiumList">
						{foreach from=$premiumGroup.data item=premium}
							<li>
								<div class="details">
									<div class="premiumButton">
										<nav class="jsMobileNavigation buttonGroupNavigation">
											<ul class="buttonList smallButtons iconList">
												<li class="jsOnly">
													{if $premium->jCoins > $__wcf->user->jCoinsBalance}
														<span class="badge red">{lang}wcf.jcoins.premiumgroups.notenougthjcoins{/lang}</span>
													{else if $premiumGroup.isMember}
														<span class="badge yellow jsPremiumGroupButton pointer" data-premium-group-id="{$premium->premiumGroupID}" data-is-member="1">{lang}wcf.jcoins.premiumgroups.renew{/lang}</span>
													{else}
														<span class="badge green jsPremiumGroupButton pointer" data-premium-group-id="{$premium->premiumGroupID}" data-is-member="0">{lang}wcf.jcoins.premiumgroups.buy{/lang}</span>
													{/if}
												</li>
											</ul>
										</nav>
									</div>

									<dl>
										<dt>{lang}wcf.jcoins.premiumgroups.costs{/lang}</dt>
										<dd>{#$premium->jCoins} {lang}wcf.jcoins.title{/lang}</dd>
									</dl>

									<dl>
										<dt>{lang}wcf.jcoins.premiumgroups.period{/lang}</dt>
										<dd>{#$premium->period} {lang}wcf.jcoins.premiumgroups.day{if $premium->period > 1}s{/if}{/lang}</dd>
									</dl>

									<dl>
										<dt>{lang}wcf.jcoins.premiumgroups.description{/lang}</dt>
										<dd>{@$premium->description|language|newlineToBreak}</dd>
									</dl>
								</div>
							</li>
						{/foreach}
					</ol>
				</div>      
			</fieldset>
		{/foreach}
		{/content}
	</div>
	{hascontentelse}
	<p class="info">{lang}wcf.jcoins.premiumgroups.nogroups{/lang}</p>
	{/hascontent}
	
	{include file='footer'}

</body>
</html>