
<%@ page import="com.freezers.Rack" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'rack.label', default: 'Rack')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
    <h1><a href="/P-Track_cscie56_final/">P-Track</a></h1>
    <div>
    <div class="navbar" role="navigation">
        <div class="navbar-inner">
            <div class="container">
                <ul class="nav">
                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
            <div
        </div>
    </div>
    </div>
    <div class ="hero-unit">
		<div id="show-rack" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list rack">
			
				<g:if test="${rackInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="rack.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${rackInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${rackInstance?.plates}">
				<li class="fieldcontain">
					<span id="plates-label" class="property-label"><g:message code="rack.plates.label" default="Plates" /></span>
					
						<g:each in="${rackInstance.plates}" var="p">
						<span class="property-value" aria-labelledby="plates-label"><g:link controller="plate" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${rackInstance?.shelf}">
				<li class="fieldcontain">
					<span id="shelf-label" class="property-label"><g:message code="rack.shelf.label" default="Shelf" /></span>
					
						<span class="property-value" aria-labelledby="shelf-label"><g:link controller="shelf" action="show" id="${rackInstance?.shelf?.id}">${rackInstance?.shelf?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:rackInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${rackInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
     </div>
	</body>
</html>
