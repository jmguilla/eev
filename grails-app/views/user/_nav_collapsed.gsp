<g:if test="${userInstance}">
<button type="button" class="btn navbar-btn btn-default dropdown-toggle hidden-sm hidden-md hidden-lg no-collapse btn-dropdown-like" data-toggle="dropdown"><span class="glyphicon glyphicon-user" style="color: #3c763d;"></span></button>
<ul class="dropdown-menu" role="menu">
  <li><a onclick="parent.location='${createLink(controller: 'user', action: 'account')}'">Compte de ${userInstance.username}</a></li>
  <li class="divider"></li>
  <li><a onclick="parent.location='${createLink(controller: 'logout')}'">Deconnexion</a></li>
</ul>
</g:if>
<g:else>
<button type="button" class="btn navbar-btn btn-default dropdown-toggle hidden-sm hidden-md hidden-lg no-collapse btn-dropdown-like" data-toggle="dropdown"><span class="glyphicon glyphicon-user" style="color: #a94442;"></span></button>
<ul class="dropdown-menu" role="menu">
  <li><a class="btn navbar-btn" onclick="parent.location='${createLink(controller: 'login', action: 'auth', absolute: true)}'">Login</a></li>
</ul>
</g:else>