<%@ page import="sakila.Film" %>



<div class="fieldcontain ${hasErrors(bean: filmInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="film.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" required="" value="${filmInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: filmInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="film.description.label" default="Description"/>

    </label>
    <g:textField name="description" value="${filmInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: filmInstance, field: 'releaseYear', 'error')} required">
    <label for="releaseYear">
        <g:message code="film.releaseYear.label" default="Release Year"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="releaseYear" type="number" value="${filmInstance.releaseYear}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: filmInstance, field: 'length', 'error')} ">
    <label for="length">
        <g:message code="film.length.label" default="Length"/>

    </label>
    <g:field name="length" type="number" value="${filmInstance.length}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: filmInstance, field: 'rating', 'error')} ">
    <label for="rating">
        <g:message code="film.rating.label" default="Rating"/>

    </label>
    <g:select name="rating" from="${sakila.Rating?.values()}" keys="${sakila.Rating.values()*.name()}"
              value="${filmInstance?.rating?.name()}" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: filmInstance, field: 'specialFeatures', 'error')} ">
    <label for="specialFeatures">
        <g:message code="film.specialFeatures.label" default="Special Features"/>

    </label>
    <g:textField name="specialFeatures" value="${filmInstance?.specialFeatures}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: filmInstance, field: 'actors', 'error')} ">
    <label for="actors">
        <g:message code="film.actors.label" default="Actors"/>

    </label>
    <g:select name="actors" from="${sakila.Actor.list()}" multiple="multiple" optionKey="id" size="5"
              value="${filmInstance?.actors*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: filmInstance, field: 'categories', 'error')} ">
    <label for="categories">
        <g:message code="film.categories.label" default="Categories"/>

    </label>
    <g:select name="categories" from="${sakila.Category.list()}" multiple="multiple" optionKey="id" size="5"
              value="${filmInstance?.categories*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: filmInstance, field: 'inventories', 'error')} ">
    <label for="inventories">
        <g:message code="film.inventories.label" default="Inventories"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${filmInstance?.inventories ?}" var="i">
            <li><g:link controller="inventory" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="inventory" action="create"
                    params="['film.id': filmInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'inventory.label', default: 'Inventory')])}</g:link>
        </li>
    </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: filmInstance, field: 'language', 'error')} required">
    <label for="language">
        <g:message code="film.language.label" default="Language"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="language" name="language.id" from="${sakila.Language.list()}" optionKey="id" required=""
              value="${filmInstance?.language?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: filmInstance, field: 'originalLanguage', 'error')} required">
    <label for="originalLanguage">
        <g:message code="film.originalLanguage.label" default="Original Language"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="originalLanguage" name="originalLanguage.id" from="${sakila.Language.list()}" optionKey="id"
              required="" value="${filmInstance?.originalLanguage?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: filmInstance, field: 'rentalDuration', 'error')} required">
    <label for="rentalDuration">
        <g:message code="film.rentalDuration.label" default="Rental Duration"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="rentalDuration" type="number" value="${filmInstance.rentalDuration}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: filmInstance, field: 'rentalRate', 'error')} required">
    <label for="rentalRate">
        <g:message code="film.rentalRate.label" default="Rental Rate"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="rentalRate" value="${fieldValue(bean: filmInstance, field: 'rentalRate')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: filmInstance, field: 'replacementCost', 'error')} required">
    <label for="replacementCost">
        <g:message code="film.replacementCost.label" default="Replacement Cost"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="replacementCost" value="${fieldValue(bean: filmInstance, field: 'replacementCost')}" required=""/>

</div>

