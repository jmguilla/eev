<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Gestion des EEVs</title>
		<r:require module="bootstrap"/>
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
