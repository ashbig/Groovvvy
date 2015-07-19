<%@ page import="com.freezers.Rack" %>



<div class="fieldcontain ${hasErrors(bean: rackInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="rack.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${rackInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: rackInstance, field: 'plates', 'error')} ">
	<label for="plates">
		<g:message code="rack.plates.label" default="Plates" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${rackInstance?.plates?}" var="p">
    <li><g:link controller="plate" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="plate" action="create" params="['rack.id': rackInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'plate.label', default: 'Plate')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: rackInstance, field: 'shelf', 'error')} required">
	<label for="shelf">
		<g:message code="rack.shelf.label" default="Shelf" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="shelf" name="shelf.id" from="${com.freezers.Shelf.list()}" optionKey="id" required="" value="${rackInstance?.shelf?.id}" class="many-to-one"/>

</div>

