
<%@ page import="com.freezers.Freezer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'freezer.label', default: 'Freezer')}" />
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
		    </div>
         </div>
    </div>
    <div class = "hero-unit">
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
			
				<g:if test="${freezerInstance?.numShelves}">
				<li class="fieldcontain">
					<span id="numShelves-label" class="property-label"><g:message code="freezer.numShelves.label" default="Num Shelves" /></span>
					
						<span class="property-value" aria-labelledby="numShelves-label"><g:fieldValue bean="${freezerInstance}" field="numShelves"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${freezerInstance?.numRacksPerShelf}">
				<li class="fieldcontain">
					<span id="numRacksPerShelf-label" class="property-label"><g:message code="freezer.numRacksPerShelf.label" default="Num Racks Per Shelf" /></span>
					
						<span class="property-value" aria-labelledby="numRacksPerShelf-label"><g:fieldValue bean="${freezerInstance}" field="numRacksPerShelf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${freezerInstance?.shelves}">
				<li class="fieldcontain">
					<span id="shelves-label" class="property-label"><g:message code="freezer.shelves.label" default="Shelves" /></span>
					
						<g:each in="${freezerInstance.shelves}" var="s">
                            <table border=1>
                                <tr>
                                    <td><g:link controller="shelf" action="show" id="${s.id}">${s?.toString()}</g:link></td>
                                    <td><g:link controller="shelf" action="edit" id="${s.id}">Edit shelf</g:link></td>
                                    <td>
                                        <table border=1>
                                        <g:each in="${s.racks}" var="r">
                                            <tr>
                                                <td><g:link controller="rack" action="show" id="${r.id}">${r?.toString()}</g:link></td>
                                                <td><g:link controller="rack" action="edit" id="${r.id}">Edit rack</g:link></td>
                                                <td>
                                                    <table border=1>
                                                        <g:each in="${r.plates}" var="p">
                                                            <tr>
                                                                <td><g:link controller="plate" action="show" id="${p.id}">${p?.toString()}</g:link></td>
                                                                <td><g:link controller="plate" action="edit" id="${p.id}">Edit plate</g:link></td>
                                                            </tr>
                                                        </g:each>
                                                    </table>
                                                </td>
                                            </tr>
                                        </g:each>
                                        </table>
                                    </td>
                                </tr>
                            </table>
						</g:each>
					
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
    </div>
	</body>
</html>
