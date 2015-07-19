
<%@ page import="com.freezers.Plate" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plate.label', default: 'Plate')}" />
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
    <div class="hero-unit"></div>
    <div id="list-plate" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'plate.name.label', default: 'Name')}" />
					
						<th><g:message code="plate.rack.label" default="Rack" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${plateInstanceList}" status="i" var="plateInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${plateInstance.id}">${fieldValue(bean: plateInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: plateInstance, field: "rack")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${plateInstanceCount ?: 0}" />
			</div>
		</div>
    </div>
	</body>
</html>
