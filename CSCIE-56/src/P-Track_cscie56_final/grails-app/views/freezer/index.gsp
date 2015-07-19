
<%@ page import="com.freezers.Freezer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'freezer.label', default: 'Freezer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
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
		<div id="list-freezer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
            <fieldset class="form">
                <g:form action="index" method="GET">
                    <div class="fieldcontain">
                        <label for="query">Search for Plates:</label>
                        <g:textField name="query" value="${params.query}"/>
                    </div>
                </g:form>
            </fieldset>
            <table width="40%">
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'freezer.name.label', default: 'Freezer Name')}" align="left" />
					
						<g:sortableColumn property="numShelves" title="${message(code: 'freezer.numShelves.label', default: 'Number of Shelves')}" align="left" />
					
						<g:sortableColumn property="numRacksPerShelf" title="${message(code: 'freezer.numRacksPerShelf.label', default: 'Racks')}" align="left" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${freezerInstanceList}" status="i" var="freezerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${freezerInstance.id}">${fieldValue(bean: freezerInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: freezerInstance, field: "numShelves")}</td>
					
						<td>${fieldValue(bean: freezerInstance, field: "numRacksPerShelf")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${freezerInstanceCount ?: 0}" />
			</div>
		</div>
    </div>
</html>
