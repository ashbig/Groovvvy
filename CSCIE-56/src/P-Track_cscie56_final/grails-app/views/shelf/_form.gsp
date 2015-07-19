<%@ page import="com.freezers.Shelf" %>



<div class="fieldcontain ${hasErrors(bean: shelfInstance, field: 'freezer', 'error')} required">
	<label for="freezer">
		<g:message code="shelf.freezer.label" default="Freezer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="freezer" name="freezer.id" from="${com.freezers.Freezer.list()}" optionKey="id" required="" value="${shelfInstance?.freezer?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: shelfInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="shelf.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${shelfInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: shelfInstance, field: 'racks', 'error')} ">
	<label for="racks">
		<g:message code="shelf.racks.label" default="Racks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${shelfInstance?.racks?}" var="r">
    <li><g:link controller="rack" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="rack" action="create" params="['shelf.id': shelfInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'rack.label', default: 'Rack')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: shelfInstance, field: 'racksPerShelf', 'error')} required">
	<label for="racksPerShelf">
		<g:message code="shelf.racksPerShelf.label" default="Racks Per Shelf" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="racksPerShelf" type="number" value="${shelfInstance.racksPerShelf}" required=""/>

</div>

