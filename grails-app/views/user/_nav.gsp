<g:if test="${userInstance}">
  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=userInstance.username%><b class="caret"></b></a>
  <ul class="dropdown-menu">
    <li><a href="${createLink(controller: 'user', action: 'account')}">Mon compte</a></li>
    <li class="divider"></li>
    <li><a href="${createLink(controller: 'logout')}">Deconnexion</a></li>
  </ul>
</g:if>
<g:else><a href="${createLink(controller: 'login', action: 'auth', absolute: true)}"><span class="glyphicon glyphicon-user"></span></a></g:else>