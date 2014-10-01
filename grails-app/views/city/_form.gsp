<%@ page import="sakila.City" %>



<div class="fieldcontain ${hasErrors(bean: cityInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="city.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" required="" value="${cityInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cityInstance, field: 'addresses', 'error')} ">
    <label for="addresses">
        <g:message code="city.addresses.label" default="Addresses"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${cityInstance?.addresses ?}" var="a">
            <li><g:link controller="address" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="address" action="create"
                    params="['city.id': cityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'address.label', default: 'Address')])}</g:link>
        </li>
    </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: cityInstance, field: 'country', 'error')} required">
    <label for="country">
        <g:message code="city.country.label" default="Country"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="country" name="country.id" from="${sakila.Country.list()}" optionKey="id" required=""
              value="${cityInstance?.country?.id}" class="many-to-one"/>

</div>

