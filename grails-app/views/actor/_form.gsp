<%@ page import="sakila.Actor" %>



<div class="fieldcontain ${hasErrors(bean: actorInstance, field: 'films', 'error')} ">
    <label for="films">
        <g:message code="actor.films.label" default="Films"/>

    </label>

</div>

<div class="fieldcontain ${hasErrors(bean: actorInstance, field: 'firstName', 'error')} required">
    <label for="firstName">
        <g:message code="actor.firstName.label" default="First Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="firstName" required="" value="${actorInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: actorInstance, field: 'lastName', 'error')} required">
    <label for="lastName">
        <g:message code="actor.lastName.label" default="Last Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="lastName" required="" value="${actorInstance?.lastName}"/>

</div>

