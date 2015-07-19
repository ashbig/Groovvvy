
<%@ page import="com.nerds.Post" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-post" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list post">
			
				<g:if test="${postInstance?.dislike}">
				<li class="fieldcontain">
					<span id="dislike-label" class="property-label"><g:message code="post.dislike.label" default="Dislike" /></span>
					
						<g:each in="${postInstance.dislike}" var="d">
						<span class="property-value" aria-labelledby="dislike-label"><g:link controller="dislike" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.like}">
				<li class="fieldcontain">
					<span id="like-label" class="property-label"><g:message code="post.like.label" default="Like" /></span>
					
						<g:each in="${postInstance.like}" var="l">
						<span class="property-value" aria-labelledby="like-label"><g:link controller="like" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.message}">
				<li class="fieldcontain">
					<span id="message-label" class="property-label"><g:message code="post.message.label" default="Message" /></span>
					
						<span class="property-value" aria-labelledby="message-label"><g:fieldValue bean="${postInstance}" field="message"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.photos}">
				<li class="fieldcontain">
					<span id="photos-label" class="property-label"><g:message code="post.photos.label" default="Photos" /></span>
					
						<span class="property-value" aria-labelledby="photos-label"><g:link controller="photos" action="show" id="${postInstance?.photos?.id}">${postInstance?.photos?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.posted}">
				<li class="fieldcontain">
					<span id="posted-label" class="property-label"><g:message code="post.posted.label" default="Posted" /></span>
					
						<span class="property-value" aria-labelledby="posted-label"><g:formatDate date="${postInstance?.posted}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:postInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${postInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
