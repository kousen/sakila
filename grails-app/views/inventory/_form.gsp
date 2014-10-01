<%@ page import="sakila.Inventory" %>



<div class="fieldcontain ${hasErrors(bean: inventoryInstance, field: 'film', 'error')} required">
    <label for="film">
        <g:message code="inventory.film.label" default="Film"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="film" name="film.id" from="${sakila.Film.list()}" optionKey="id" required=""
              value="${inventoryInstance?.film?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: inventoryInstance, field: 'rentals', 'error')} ">
    <label for="rentals">
        <g:message code="inventory.rentals.label" default="Rentals"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${inventoryInstance?.rentals ?}" var="r">
            <li><g:link controller="rental" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="rental" action="create"
                    params="['inventory.id': inventoryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'rental.label', default: 'Rental')])}</g:link>
        </li>
    </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: inventoryInstance, field: 'store', 'error')} required">
    <label for="store">
        <g:message code="inventory.store.label" default="Store"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="store" name="store.id" from="${sakila.Store.list()}" optionKey="id" required=""
              value="${inventoryInstance?.store?.id}" class="many-to-one"/>

</div>

