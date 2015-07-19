<%@ page import="com.nerds.Nerd" %>



<div class="fieldcontain ${hasErrors(bean: nerdInstance, field: 'acceptedTerms', 'error')} ">
	<label for="acceptedTerms">
		<g:message code="nerd.acceptedTerms.label" default="Accepted Terms" />
		
	</label>
	<g:checkBox name="acceptedTerms" value="${nerdInstance?.acceptedTerms}" />

</div>

<div class="fieldcontain ${hasErrors(bean: nerdInstance, field: 'birthdate', 'error')} ">
	<label for="birthdate">
		<g:message code="nerd.birthdate.label" default="Birthdate" />
		
	</label>
	<g:datePicker name="birthdate" precision="day" value="${nerdInstance?.birthdate}" />

</div>

<div class="fieldcontain ${hasErrors(bean: nerdInstance, field: 'firstname', 'error')} ">
	<label for="firstname">
		<g:message code="nerd.firstname.label" default="Firstname" />
		
	</label>
	<g:textField name="firstname" value="${nerdInstance?.firstname}" />

</div>

<div class="fieldcontain ${hasErrors(bean: nerdInstance, field: 'intials', 'error')} ">
	<label for="intials">
		<g:message code="nerd.intials.label" default="Intials" />
		
	</label>
	<g:textField name="intials" value="${nerdInstance?.intials}" />

</div>

<div class="fieldcontain ${hasErrors(bean: nerdInstance, field: 'lastname', 'error')} ">
	<label for="lastname">
		<g:message code="nerd.lastname.label" default="Lastname" />
		
	</label>
	<g:textField name="lastname" value="${nerdInstance?.lastname}" />

</div>

