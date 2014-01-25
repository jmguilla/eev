<nav class="navbar navbar-default" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a>
    <!-- Trick to appropriate rendering with collapsed navbar -->
	<div ng-cloak class="btn-group navbar-nav pull-left" ng-bind-html="userNavCollapsed"></div>
	<div ng-cloak class="btn-group navbar-nav pull-left" ng-bind-html="userNav"></div>
	<a ng-cloak ng-if="syncing == true" class="navbar-brand" href="#"><span class="glyphicon glyphicon-import" style="color: #8a6d3b;font-size: 14px;"></span></a>
	<a ng-cloak ng-if="synced == true"  class="navbar-brand" href="#"><span class="glyphicon glyphicon-import" style="color: #31708f;font-size: 14px;"></span></a>

  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
      <li><a href="${createLink(controller: 'EEVQuestions', action: 'show', id: 1)}"><span class="glyphicon glyphicon-comment"></span></a></li>
      <li><a href="${createLink(controller: 'EEVAnswers', action: 'list')}"><span class="glyphicon glyphicon-list"></span></a></li>
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>
