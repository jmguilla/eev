<html>
<head>
	<meta name='layout' content='main_no_cache'/>
	<title><g:message code="springSecurity.login.title"/></title>
	<r:require module="angular_app"/>
</head>
<body>
<g:render template="/shared/nav"/>
<g:render template="/shared/alerts"/>
<div id='login'>
	<div class='container'>
		<div class="row">
			<form action='${postUrl}' method='POST' id='loginForm' class='col-xs-12 col-md-4 col-md-offset-4 form-horizontal' role="form" autocomplete='off'>
				<div class="form-group">
				    <label for="username" class="col-sm-2 control-label">login</label>
				    <div class="col-sm-10">
				      <input type="text" name='j_username' class="form-control" id="username" placeholder="Login">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="password" class="col-sm-2 control-label">pwd</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" name='j_password' id="password" placeholder="Password">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <div class="checkbox">
				        <label>
				          <input type="checkbox"> Remember me
				        </label>
				      </div>
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="submit" class="btn btn-default">Login</button>
				    </div>
				  </div>
			</form>
		</div>
	</div>
</div>
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
