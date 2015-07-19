<%@ page import="com.freezers.Freezer" %>



<div class="fieldcontain ${hasErrors(bean: freezerInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="freezer.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${freezerInstance?.name}" />

</div>

<div class="fieldcontain ${hasErrors(bean: freezerInstance, field: 'rackspershelf', 'error')} ">
	<label for="rackspershelf">
		<g:message code="freezer.rackspershelf.label" default="Rackspershelf" />
		
	</label>
	<g:field type="number" name="rackspershelf" value="${freezerInstance.rackspershelf}" />

</div>

<div class="fieldcontain ${hasErrors(bean: freezerInstance, field: 'shelves', 'error')} ">
	<label for="shelves">
		<g:message code="freezer.shelves.label" default="Shelves" />
		
	</label>
	<g:field type="number" name="shelves" value="${freezerInstance.shelves}" />

</div>

