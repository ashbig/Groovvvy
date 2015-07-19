
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

                <g:if test="${nerdInstance?.firstName}">
                    <li class="fieldcontain">
                        <span id="firstName-label" class="property-label"><g:message code="nerd.firstName.label" default="First Name" /></span>

                        <span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${nerdInstance}" field="firstName"/></span>

                    </li>
                </g:if>

                <g:if test="${nerdInstance?.middleInitial}">
                    <li class="fieldcontain">
                        <span id="middleInitial-label" class="property-label"><g:message code="nerd.middleInitial.label" default="Middle Initial" /></span>

                        <span class="property-value" aria-labelledby="middleInitial-label"><g:fieldValue bean="${nerdInstance}" field="middleInitial"/></span>

                    </li>
                </g:if>

                <g:if test="${nerdInstance?.lastName}">
                    <li class="fieldcontain">
                        <span id="lastName-label" class="property-label"><g:message code="nerd.lastName.label" default="Last Name" /></span>

                        <span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${nerdInstance}" field="lastName"/></span>

                    </li>
                </g:if>
			
				<g:if test="${nerdInstance?.dateOfBirth}">
				<li class="fieldcontain">
					<span id="dateOfBirth-label" class="property-label"><g:message code="nerd.dateOfBirth.label" default="Date Of Birth" /></span>
					
						<span class="property-value" aria-labelledby="dateOfBirth-label"><g:formatDate date="${nerdInstance?.dateOfBirth}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nerdInstance?.eMail}">
				<li class="fieldcontain">
					<span id="eMail-label" class="property-label"><g:message code="nerd.eMail.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="eMail-label"><g:fieldValue bean="${nerdInstance}" field="eMail"/></span>
					
				</li>
				</g:if>

                <g:if test="${nerdInstance?.acceptedTerms}">
                    <li class="fieldcontain">
                        <span id="acceptedTerms-label" class="property-label"><g:message code="nerd.acceptedTerms.label" default="Accepted Terms" /></span>

                        <span class="property-value" aria-labelledby="acceptedTerms-label"><g:formatBoolean boolean="${nerdInstance?.acceptedTerms}" /></span>

                    </li>
                </g:if>
			
			</ol>
<%--<g:form url="[resource:nerdInstance, action:'delete']" method="DELETE">
    <fieldset class="buttons">
        <g:link class="edit" action="edit" resource="${nerdInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
    </fieldset>
</g:form>--%>
</div>
</body>
</html>
