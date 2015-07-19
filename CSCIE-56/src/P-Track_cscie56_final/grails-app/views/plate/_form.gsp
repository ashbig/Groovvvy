<%@ page import="com.freezers.Plate" %>



<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="plate.name.label" default="Name" />
		
	</label>
	<g:textField name="name" maxlength="30" value="${plateInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'rack', 'error')} required">
	<label for="rack">
		<g:message code="plate.rack.label" default="Rack" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="rack" name="rack.id" from="${com.freezers.Rack.list()}" optionKey="id" required="" value="${plateInstance?.rack?.id}" class="many-to-one"/>

</div>

