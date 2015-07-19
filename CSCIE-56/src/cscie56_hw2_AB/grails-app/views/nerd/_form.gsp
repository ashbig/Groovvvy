<%@ page import="com.nerds.Nerd" %>


<div class="fieldcontain ${hasErrors(bean: nerdInstance, field: 'firstName', 'error')} required">
    <label for="firstName">
        <g:message code="nerd.firstName.label" default="First Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="firstName" required="" value="${nerdInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: nerdInstance, field: 'middleInitial', 'error')} ">
    <label for="middleInitial">
        <g:message code="nerd.middleInitial.label" default="Middle Initial" />

    </label>
    <g:textField name="middleInitial" value="${nerdInstance?.middleInitial}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: nerdInstance, field: 'lastName', 'error')} required">
    <label for="lastName">
        <g:message code="nerd.lastName.label" default="Last Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="lastName" required="" value="${nerdInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: nerdInstance, field: 'dateOfBirth', 'error')} required">
	<label for="dateOfBirth">
		<g:message code="nerd.dateOfBirth.label" default="Date Of Birth" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfBirth" precision="day"  value="${nerdInstance?.dateOfBirth}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: nerdInstance, field: 'eMail', 'error')} required">
	<label for="eMail">
		<g:message code="nerd.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="eMail" required="" value="${nerdInstance?.eMail}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: nerdInstance, field: 'acceptedTerms', 'error')} ">
    <label for="acceptedTerms">
        <g:message code="nerd.acceptedTerms.label" default="Accepted Terms" />

    </label>
    <g:checkBox name="acceptedTerms" value="${nerdInstance?.acceptedTerms}" />

</div>

