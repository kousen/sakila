<%@ page import="sakila.Store" %>



<div class="fieldcontain ${hasErrors(bean: storeInstance, field: 'address', 'error')} required">
    <label for="address">
        <g:message code="store.address.label" default="Address"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="address" name="address.id" from="${sakila.Address.list()}" optionKey="id" required=""
              value="${storeInstance?.address?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: storeInstance, field: 'customers', 'error')} ">
    <label for="customers">
        <g:message code="store.customers.label" default="Customers"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${storeInstance?.customers ?}" var="c">
            <li><g:link controller="customer" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="customer" action="create"
                    params="['store.id': storeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'customer.label', default: 'Customer')])}</g:link>
        </li>
    </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: storeInstance, field: 'inventories', 'error')} ">
    <label for="inventories">
        <g:message code="store.inventories.label" default="Inventories"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${storeInstance?.inventories ?}" var="i">
            <li><g:link controller="inventory" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="inventory" action="create"
                    params="['store.id': storeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'inventory.label', default: 'Inventory')])}</g:link>
        </li>
    </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: storeInstance, field: 'manager', 'error')} required">
    <label for="manager">
        <g:message code="store.manager.label" default="Manager"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="manager" name="manager.id" from="${sakila.Staff.list()}" optionKey="id" required=""
              value="${storeInstance?.manager?.id}" class="many-to-one"/>

</div>

