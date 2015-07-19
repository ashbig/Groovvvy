<%@ page import="com.freezers.Freezer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'freezer.label', default: 'Freezer')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
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
		<div id="edit-freezer" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${freezerInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${freezerInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:freezerInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${freezerInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
     </div>
	</body>
</html>
