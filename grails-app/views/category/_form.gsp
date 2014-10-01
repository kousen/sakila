<%@ page import="sakila.Category" %>



<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'films', 'error')} ">
    <label for="films">
        <g:message code="category.films.label" default="Films"/>

    </label>

</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="category.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" required="" value="${categoryInstance?.name}"/>

</div>

