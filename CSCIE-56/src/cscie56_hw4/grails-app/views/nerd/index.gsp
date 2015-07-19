
<%@ page import="com.nerds.Nerd" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'nerd.label', default: 'Nerd')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-nerd" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-nerd" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="acceptedTerms" title="${message(code: 'nerd.acceptedTerms.label', default: 'Accepted Terms')}" />
					
						<g:sortableColumn property="birthdate" title="${message(code: 'nerd.birthdate.label', default: 'Birthdate')}" />
					
						<g:sortableColumn property="firstname" title="${message(code: 'nerd.firstname.label', default: 'Firstname')}" />
					
						<g:sortableColumn property="intials" title="${message(code: 'nerd.intials.label', default: 'Intials')}" />
					
						<g:sortableColumn property="lastname" title="${message(code: 'nerd.lastname.label', default: 'Lastname')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${nerdInstanceList}" status="i" var="nerdInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${nerdInstance.id}">${fieldValue(bean: nerdInstance, field: "acceptedTerms")}</g:link></td>
					
						<td><g:formatDate date="${nerdInstance.birthdate}" /></td>
					
						<td>${fieldValue(bean: nerdInstance, field: "firstname")}</td>
					
						<td>${fieldValue(bean: nerdInstance, field: "intials")}</td>
					
						<td>${fieldValue(bean: nerdInstance, field: "lastname")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${nerdInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
