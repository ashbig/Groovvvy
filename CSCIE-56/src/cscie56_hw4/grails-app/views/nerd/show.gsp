
<%@ page import="com.nerds.Nerd" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'nerd.label', default: 'Nerd')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-nerd" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-nerd" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list nerd">
			
				<g:if test="${nerdInstance?.acceptedTerms}">
				<li class="fieldcontain">
					<span id="acceptedTerms-label" class="property-label"><g:message code="nerd.acceptedTerms.label" default="Accepted Terms" /></span>
					
						<span class="property-value" aria-labelledby="acceptedTerms-label"><g:formatBoolean boolean="${nerdInstance?.acceptedTerms}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nerdInstance?.birthdate}">
				<li class="fieldcontain">
					<span id="birthdate-label" class="property-label"><g:message code="nerd.birthdate.label" default="Birthdate" /></span>
					
						<span class="property-value" aria-labelledby="birthdate-label"><g:formatDate date="${nerdInstance?.birthdate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nerdInstance?.firstname}">
				<li class="fieldcontain">
					<span id="firstname-label" class="property-label"><g:message code="nerd.firstname.label" default="Firstname" /></span>
					
						<span class="property-value" aria-labelledby="firstname-label"><g:fieldValue bean="${nerdInstance}" field="firstname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nerdInstance?.intials}">
				<li class="fieldcontain">
					<span id="intials-label" class="property-label"><g:message code="nerd.intials.label" default="Intials" /></span>
					
						<span class="property-value" aria-labelledby="intials-label"><g:fieldValue bean="${nerdInstance}" field="intials"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nerdInstance?.lastname}">
				<li class="fieldcontain">
					<span id="lastname-label" class="property-label"><g:message code="nerd.lastname.label" default="Lastname" /></span>
					
						<span class="property-value" aria-labelledby="lastname-label"><g:fieldValue bean="${nerdInstance}" field="lastname"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:nerdInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${nerdInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
