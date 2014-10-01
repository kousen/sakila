<%@ page import="sakila.Customer" %>



<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'firstName', 'error')} required">
    <label for="firstName">
        <g:message code="customer.firstName.label" default="First Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="firstName" required="" value="${customerInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'lastName', 'error')} required">
    <label for="lastName">
        <g:message code="customer.lastName.label" default="Last Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="lastName" required="" value="${customerInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'email', 'error')} ">
    <label for="email">
        <g:message code="customer.email.label" default="Email"/>

    </label>
    <g:field type="email" name="email" value="${customerInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'active', 'error')} ">
    <label for="active">
        <g:message code="customer.active.label" default="Active"/>

    </label>
    <g:checkBox name="active" value="${customerInstance?.active}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'address', 'error')} required">
    <label for="address">
        <g:message code="customer.address.label" default="Address"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="address" name="address.id" from="${sakila.Address.list()}" optionKey="id" required=""
              value="${customerInstance?.address?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'payments', 'error')} ">
    <label for="payments">
        <g:message code="customer.payments.label" default="Payments"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${customerInstance?.payments ?}" var="p">
            <li><g:link controller="payment" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="payment" action="create"
                    params="['customer.id': customerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'payment.label', default: 'Payment')])}</g:link>
        </li>
    </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'rentals', 'error')} ">
    <label for="rentals">
        <g:message code="customer.rentals.label" default="Rentals"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${customerInstance?.rentals ?}" var="r">
            <li><g:link controller="rental" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="rental" action="create"
                    params="['customer.id': customerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'rental.label', default: 'Rental')])}</g:link>
        </li>
    </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'store', 'error')} required">
    <label for="store">
        <g:message code="customer.store.label" default="Store"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="store" name="store.id" from="${sakila.Store.list()}" optionKey="id" required=""
              value="${customerInstance?.store?.id}" class="many-to-one"/>

</div>

