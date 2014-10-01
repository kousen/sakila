<%@ page import="sakila.Address" %>



<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'street1', 'error')} required">
    <label for="street1">
        <g:message code="address.street1.label" default="Street1"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="street1" required="" value="${addressInstance?.street1}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'street2', 'error')} ">
    <label for="street2">
        <g:message code="address.street2.label" default="Street2"/>

    </label>
    <g:textField name="street2" value="${addressInstance?.street2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'district', 'error')} required">
    <label for="district">
        <g:message code="address.district.label" default="District"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="district" required="" value="${addressInstance?.district}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'postalCode', 'error')} ">
    <label for="postalCode">
        <g:message code="address.postalCode.label" default="Postal Code"/>

    </label>
    <g:textField name="postalCode" value="${addressInstance?.postalCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'phone', 'error')} required">
    <label for="phone">
        <g:message code="address.phone.label" default="Phone"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="phone" required="" value="${addressInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'city', 'error')} required">
    <label for="city">
        <g:message code="address.city.label" default="City"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="city" name="city.id" from="${sakila.City.list()}" optionKey="id" required=""
              value="${addressInstance?.city?.id}" class="many-to-one"/>

</div>

