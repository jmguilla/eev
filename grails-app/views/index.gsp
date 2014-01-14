<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name = "viewport" content = "user-scalable=no, initial-scale=1.0, maximum-scale=1.0, width=device-width">
		<meta name="apple-mobile-web-app-capable" content="yes"/>
		<meta name="layout" content="main"/>
		<title>Gestion des EEVs</title>
		<r:require module="angular_app"/>
	</head>
	<body>
		<g:render template="/shared/nav"/>
		<div class="container">
			<div class="jumbotron">
			  <h1>Gestion des EEVs</h1>
			  <p>
				  <a class="btn btn-primary btn-lg" role="button" href="${createLink(controller: 'EEVQuestions', action: 'show', id: 1)}">Remplir</a>
				  <a class="btn btn-primary btn-lg" role="button" href="${createLink(controller: 'EEVAnswers', action: 'list')}">Lister</a>
			  </p>
			</div>
		</div>
	</body>
</html>
