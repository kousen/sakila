<%@ page import="sakila.Staff" %>



<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'firstName', 'error')} required">
    <label for="firstName">
        <g:message code="staff.firstName.label" default="First Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="firstName" required="" value="${staffInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'lastName', 'error')} required">
    <label for="lastName">
        <g:message code="staff.lastName.label" default="Last Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="lastName" required="" value="${staffInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'picture', 'error')} ">
    <label for="picture">
        <g:message code="staff.picture.label" default="Picture"/>

    </label>
    <input type="file" id="picture" name="picture"/>

</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'email', 'error')} ">
    <label for="email">
        <g:message code="staff.email.label" default="Email"/>

    </label>
    <g:field type="email" name="email" value="${staffInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'password', 'error')} ">
    <label for="password">
        <g:message code="staff.password.label" default="Password"/>

    </label>
    <g:textField name="password" value="${staffInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'active', 'error')} ">
    <label for="active">
        <g:message code="staff.active.label" default="Active"/>

    </label>
    <g:checkBox name="active" value="${staffInstance?.active}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'address', 'error')} required">
    <label for="address">
        <g:message code="staff.address.label" default="Address"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="address" name="address.id" from="${sakila.Address.list()}" optionKey="id" required=""
              value="${staffInstance?.address?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'payments', 'error')} ">
    <label for="payments">
        <g:message code="staff.payments.label" default="Payments"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${staffInstance?.payments ?}" var="p">
            <li><g:link controller="payment" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="payment" action="create"
                    params="['staff.id': staffInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'payment.label', default: 'Payment')])}</g:link>
        </li>
    </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'rentals', 'error')} ">
    <label for="rentals">
        <g:message code="staff.rentals.label" default="Rentals"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${staffInstance?.rentals ?}" var="r">
            <li><g:link controller="rental" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="rental" action="create"
                    params="['staff.id': staffInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'rental.label', default: 'Rental')])}</g:link>
        </li>
    </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'store', 'error')} required">
    <label for="store">
        <g:message code="staff.store.label" default="Store"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="store" name="store.id" from="${sakila.Store.list()}" optionKey="id" required=""
              value="${staffInstance?.store?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'userName', 'error')} required">
    <label for="userName">
        <g:message code="staff.userName.label" default="User Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="userName" required="" value="${staffInstance?.userName}"/>

</div>

