<%@ page import="sakila.Rental" %>



<div class="fieldcontain ${hasErrors(bean: rentalInstance, field: 'rentalDate', 'error')} required">
    <label for="rentalDate">
        <g:message code="rental.rentalDate.label" default="Rental Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="rentalDate" precision="day" value="${rentalInstance?.rentalDate}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: rentalInstance, field: 'returnDate', 'error')} ">
    <label for="returnDate">
        <g:message code="rental.returnDate.label" default="Return Date"/>

    </label>
    <g:datePicker name="returnDate" precision="day" value="${rentalInstance?.returnDate}" default="none"
                  noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: rentalInstance, field: 'customer', 'error')} required">
    <label for="customer">
        <g:message code="rental.customer.label" default="Customer"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="customer" name="customer.id" from="${sakila.Customer.list()}" optionKey="id" required=""
              value="${rentalInstance?.customer?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: rentalInstance, field: 'inventory', 'error')} required">
    <label for="inventory">
        <g:message code="rental.inventory.label" default="Inventory"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="inventory" name="inventory.id" from="${sakila.Inventory.list()}" optionKey="id" required=""
              value="${rentalInstance?.inventory?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: rentalInstance, field: 'payments', 'error')} ">
    <label for="payments">
        <g:message code="rental.payments.label" default="Payments"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${rentalInstance?.payments ?}" var="p">
            <li><g:link controller="payment" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="payment" action="create"
                    params="['rental.id': rentalInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'payment.label', default: 'Payment')])}</g:link>
        </li>
    </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: rentalInstance, field: 'staff', 'error')} required">
    <label for="staff">
        <g:message code="rental.staff.label" default="Staff"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="staff" name="staff.id" from="${sakila.Staff.list()}" optionKey="id" required=""
              value="${rentalInstance?.staff?.id}" class="many-to-one"/>

</div>

