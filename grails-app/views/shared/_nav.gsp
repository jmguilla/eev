<g:set var="springSecurityService" bean="springSecurityService"/>
<nav class="navbar navbar-default" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="${createLink(dir: ''}"><span class="glyphicon glyphicon-home"></span></a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
      <li><a href="#"><span class="glyphicon glyphicon-comment"></span></a></li>
      <li><a href="#"><span class="glyphicon glyphicon-list"></span></a></li>
      <sec:ifLoggedIn>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=springSecurityService.getCurrentUser().username%><b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="${createLink(controller: 'user', action: 'account')}">Mon compte</a></li>
          <li class="divider"></li>
          <li><a href="${createLink(controller: 'logout')}">Deconnexion</a></li>
        </ul>
      </li>
      </sec:ifLoggedIn>
      <sec:ifNotLoggedIn>
      	<li><a href="${createLink(controller: 'auth', action: 'login')}"><span class="glyphicon glyphicon-user"></span></a></li>
      </sec:ifNotLoggedIn>
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>
