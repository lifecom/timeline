{include file='header.tpl'}

<script type="text/javascript">
	jQuery(document).ready(function($){
		$('#login-form').bind('submit',function(){
			ls.user.login('login-form');
			return false;
		});
		$('#login-form-submit').attr('disabled',false);
	});
</script>

<h2 class="page-header">{$aLang.user_authorization}</h2>

<div class="wrapper-content">

{hook run='login_begin'}

<form action="{router page='login'}" method="POST" id="login-form">
	{hook run='form_login_begin'}

	<p><label for="login">{$aLang.user_login}</label>
	<input type="text" id="login" name="login" class="input-text input-width-full" /></p>
	
	<p><label for="password">{$aLang.user_password}</label>
	<input type="password" id="password" name="password" class="input-text input-width-full" />
	<small class="validate-error-hide validate-error-login"></small></p>
	
	<p><label><input type="checkbox" name="remember" checked class="input-checkbox" /> {$aLang.user_login_remember}</label></p>
	
	{hook run='form_login_end'}

</div>
<div class="wrapper-content wrapper-content-dark">
	<button type="submit"  name="submit_login" class="button button-primary" id="login-form-submit" disabled="disabled">{$aLang.user_login_submit}</button>
</div>
<div class="wrapper-content">
	<a href="{router page='registration'}">{$aLang.user_registration}</a><br />
	<a href="{router page='login'}reminder/">{$aLang.user_password_reminder}</a>
</div>
</form>


{if $oConfig->GetValue('general.reg.invite')}
	<br /><br />
	<form action="{router page='registration'}invite/" method="POST">
		<h2 class="page-header">{$aLang.registration_invite}</h2>

		<p><label>{$aLang.registration_invite_code}<br />
		<input class="input-text input-width-full" type="text" name="invite_code" /></label></p>
		<button type="submit"  name="submit_invite" class="button button-primary" id="login-form-submit">{$aLang.registration_invite_check}</button>
	</form>
{/if}

{hook run='login_end'}

<style>
#content {
	width: 320px!important;
}
</style>

{include file='footer_login.tpl'}
