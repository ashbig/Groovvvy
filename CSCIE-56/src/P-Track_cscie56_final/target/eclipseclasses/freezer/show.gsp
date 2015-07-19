
<%@ page import="com.freezers.Freezer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'freezer.label', default: 'Freezer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-freezer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-freezer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list freezer">
			
				<g:if test="${freezerInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="freezer.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${freezerInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${freezerInstance?.rackspershelf}">
				<li class="fieldcontain">
					<span id="rackspershelf-label" class="property-label"><g:message code="freezer.rackspershelf.label" default="Rackspershelf" /></span>
					
						<span class="property-value" aria-labelledby="rackspershelf-label"><g:fieldValue bean="${freezerInstance}" field="rackspershelf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${freezerInstance?.shelves}">
				<li class="fieldcontain">
					<span id="shelves-label" class="property-label"><g:message code="freezer.shelves.label" default="Shelves" /></span>
					
						<span class="property-value" aria-labelledby="shelves-label"><g:fieldValue bean="${freezerInstance}" field="shelves"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:freezerInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${freezerInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
