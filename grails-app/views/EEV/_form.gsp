<%@ page import="com.jmguilla.eev.EEV" %>



<div class="fieldcontain ${hasErrors(bean: EEVInstance, field: 'owner', 'error')} ">
	<label for="owner">
		<g:message code="EEV.owner.label" default="Owner" />
		
	</label>
	<g:select id="owner" name="owner.id" from="${com.jmguilla.eev.User.list()}" optionKey="id" value="${EEVInstance?.owner?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: EEVInstance, field: 'interviewee', 'error')} ">
	<label for="interviewee">
		<g:message code="EEV.interviewee.label" default="Interviewee" />
		
	</label>
	<g:select id="interviewee" name="interviewee.id" from="${com.jmguilla.eev.User.list()}" optionKey="id" value="${EEVInstance?.interviewee?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: EEVInstance, field: 'rowsGroups', 'error')} ">
	<label for="rowsGroups">
		<g:message code="EEV.rowsGroups.label" default="Rows Groups" />
		
	</label>
	<g:select name="rowsGroups" from="${com.jmguilla.eev.EEVRowsGroup.list()}" multiple="multiple" optionKey="id" size="5" value="${EEVInstance?.rowsGroups*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: EEVInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="EEV.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${EEVInstance?.title}"/>
</div>

