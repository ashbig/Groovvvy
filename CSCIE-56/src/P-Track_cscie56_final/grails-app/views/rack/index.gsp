
<%@ page import="com.freezers.Rack" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'rack.label', default: 'Rack')}" />
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
		<div id="list-rack" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'rack.name.label', default: 'Name')}" />
					
						<th><g:message code="rack.shelf.label" default="Shelf" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${rackInstanceList}" status="i" var="rackInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${rackInstance.id}">${fieldValue(bean: rackInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: rackInstance, field: "shelf")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${rackInstanceCount ?: 0}" />
			</div>
		</div>
     </div>
	</body>
</html>
