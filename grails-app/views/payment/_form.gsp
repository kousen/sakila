<%@ page import="sakila.Payment" %>



<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'amount', 'error')} required">
    <label for="amount">
        <g:message code="payment.amount.label" default="Amount"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="amount" value="${fieldValue(bean: paymentInstance, field: 'amount')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'customer', 'error')} required">
    <label for="customer">
        <g:message code="payment.customer.label" default="Customer"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="customer" name="customer.id" from="${sakila.Customer.list()}" optionKey="id" required=""
              value="${paymentInstance?.customer?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'paymentDate', 'error')} required">
    <label for="paymentDate">
        <g:message code="payment.paymentDate.label" default="Payment Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="paymentDate" precision="day" value="${paymentInstance?.paymentDate}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'rental', 'error')} required">
    <label for="rental">
        <g:message code="payment.rental.label" default="Rental"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="rental" name="rental.id" from="${sakila.Rental.list()}" optionKey="id" required=""
              value="${paymentInstance?.rental?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'staff', 'error')} required">
    <label for="staff">
        <g:message code="payment.staff.label" default="Staff"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="staff" name="staff.id" from="${sakila.Staff.list()}" optionKey="id" required=""
              value="${paymentInstance?.staff?.id}" class="many-to-one"/>

</div>

