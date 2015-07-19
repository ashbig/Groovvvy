
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

                        <g:sortableColumn property="firstName" title="${message(code: 'nerd.firstName.label', default: 'First Name')}" />

                        <g:sortableColumn property="middleInitial" title="${message(code: 'nerd.middleInitial.label', default: 'Middle Initial')}" />

                        <g:sortableColumn property="lastName" title="${message(code: 'nerd.lastName.label', default: 'Last Name')}" />

						<g:sortableColumn property="dateOfBirth" title="${message(code: 'nerd.dateOfBirth.label', default: 'Date Of Birth')}" />

                        <g:sortableColumn property="eMail" title="${message(code: 'nerd.email.label', default: 'Email')}" />

                        <g:sortableColumn property="acceptedTerms" title="${message(code: 'nerd.acceptedTerms.label', default: 'Accepted Terms')}" />

                    </tr>
				</thead>
				<tbody>
				<g:each in="${nerdInstanceList}" status="i" var="nerdInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${nerdInstance.id}">${fieldValue(bean: nerdInstance, field: "firstName")}</g:link></td>

                        <td>${fieldValue(bean: nerdInstance, field: "middleInitial")}</td>

                        <td>${fieldValue(bean: nerdInstance, field: "lastName")}</td>

                        <td><g:formatDate format="dd-MM-yyyy" date="${nerdInstance.dateOfBirth}" /></td>

                        <td>${fieldValue(bean: nerdInstance, field: "eMail")}</td>

                        <td><g:formatBoolean boolean="${nerdInstance.acceptedTerms}" /></td>

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
