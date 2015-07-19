<%@ page import="com.freezers.Freezer" %>



<div class="fieldcontain ${hasErrors(bean: freezerInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="freezer.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="20" required="" value="${freezerInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: freezerInstance, field: 'numShelves', 'error')} required">
	<label for="numShelves">
		<g:message code="freezer.numShelves.label" default="Num Shelves" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numShelves" type="number" value="${freezerInstance.numShelves}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: freezerInstance, field: 'numRacksPerShelf', 'error')} required">
	<label for="numRacksPerShelf">
		<g:message code="freezer.numRacksPerShelf.label" default="Num Racks Per Shelf" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numRacksPerShelf" type="number" value="${freezerInstance.numRacksPerShelf}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: freezerInstance, field: 'shelves', 'error')} ">
	<label for="shelves">
		<g:message code="freezer.shelves.label" default="Shelves" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${freezerInstance?.shelves?}" var="s">
    <li><g:link controller="shelf" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="shelf" action="create" params="['freezer.id': freezerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'shelf.label', default: 'Shelf')])}</g:link>
</li>
</ul>


</div>

