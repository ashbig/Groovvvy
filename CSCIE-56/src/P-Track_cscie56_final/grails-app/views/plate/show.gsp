
<%@ page import="com.freezers.Plate" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plate.label', default: 'Plate')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
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
		<div id="show-plate" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list plate">
			
				<g:if test="${plateInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="plate.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${plateInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${plateInstance?.rack}">
				<li class="fieldcontain">
					<span id="rack-label" class="property-label"><g:message code="plate.rack.label" default="Rack" /></span>
					
						<span class="property-value" aria-labelledby="rack-label"><g:link controller="rack" action="show" id="${plateInstance?.rack?.id}">${plateInstance?.rack?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:plateInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${plateInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
    </div>
</div>
	</body>
</html>
