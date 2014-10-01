<%@ page import="sakila.Language" %>



<div class="fieldcontain ${hasErrors(bean: languageInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="language.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" maxlength="20" required="" value="${languageInstance?.name}"/>

</div>

