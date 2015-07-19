<%@ page import="com.nerds.Post" %>



<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'dislike', 'error')} ">
	<label for="dislike">
		<g:message code="post.dislike.label" default="Dislike" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${postInstance?.dislike?}" var="d">
    <li><g:link controller="dislike" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="dislike" action="create" params="['post.id': postInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'dislike.label', default: 'Dislike')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'like', 'error')} ">
	<label for="like">
		<g:message code="post.like.label" default="Like" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${postInstance?.like?}" var="l">
    <li><g:link controller="like" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="like" action="create" params="['post.id': postInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'like.label', default: 'Like')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'message', 'error')} ">
	<label for="message">
		<g:message code="post.message.label" default="Message" />
		
	</label>
	<g:textField name="message" value="${postInstance?.message}" />

</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'photos', 'error')} ">
	<label for="photos">
		<g:message code="post.photos.label" default="Photos" />
		
	</label>
	<g:select id="photos" name="photos.id" from="${com.nerds.Photos.list()}" optionKey="id" required="" value="${postInstance?.photos?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'posted', 'error')} ">
	<label for="posted">
		<g:message code="post.posted.label" default="Posted" />
		
	</label>
	<g:datePicker name="posted" precision="day" value="${postInstance?.posted}" />

</div>

