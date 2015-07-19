
<%@ page import="com.freezers.Shelf" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shelf.label', default: 'Shelf')}" />
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
        <div class="hero-unit">
		<div id="list-shelf" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="shelf.freezer.label" default="Freezer" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'shelf.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="racksPerShelf" title="${message(code: 'shelf.racksPerShelf.label', default: 'Racks Per Shelf')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${shelfInstanceList}" status="i" var="shelfInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${shelfInstance.id}">${fieldValue(bean: shelfInstance, field: "freezer")}</g:link></td>
					
						<td>${fieldValue(bean: shelfInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: shelfInstance, field: "racksPerShelf")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${shelfInstanceCount ?: 0}" />
			</div>
		</div>
    </div>
	</body>
</html>
