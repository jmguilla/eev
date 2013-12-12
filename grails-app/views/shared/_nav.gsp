<nav class="navbar navbar-default" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <a class="navbar-brand" href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a>
    <a class="navbar-brand" href="${createLink(controller: 'EEVQuestions', action: 'show', id: 1)}"><span class="glyphicon glyphicon-comment"></span></a>
    <a class="navbar-brand" href="${createLink(controller: 'EEVAnswers', action: 'list')}"><span class="glyphicon glyphicon-list-alt"></span></a	>
  </div>
</nav>