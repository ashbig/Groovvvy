
<%@ page import="com.freezers.Shelf" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shelf.label', default: 'Shelf')}" />
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
        <div class="hero-unit">
		<div id="show-shelf" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list shelf">
			
				<g:if test="${shelfInstance?.freezer}">
				<li class="fieldcontain">
					<span id="freezer-label" class="property-label"><g:message code="shelf.freezer.label" default="Freezer" /></span>
					
						<span class="property-value" aria-labelledby="freezer-label"><g:link controller="freezer" action="show" id="${shelfInstance?.freezer?.id}">${shelfInstance?.freezer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${shelfInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="shelf.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${shelfInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shelfInstance?.racks}">
				<li class="fieldcontain">
					<span id="racks-label" class="property-label"><g:message code="shelf.racks.label" default="Racks" /></span>
					
						<g:each in="${shelfInstance.racks}" var="r">
						<span class="property-value" aria-labelledby="racks-label"><g:link controller="rack" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${shelfInstance?.racksPerShelf}">
				<li class="fieldcontain">
					<span id="racksPerShelf-label" class="property-label"><g:message code="shelf.racksPerShelf.label" default="Racks Per Shelf" /></span>
					
						<span class="property-value" aria-labelledby="racksPerShelf-label"><g:fieldValue bean="${shelfInstance}" field="racksPerShelf"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:shelfInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${shelfInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
     </div>
	</body>
</html>
