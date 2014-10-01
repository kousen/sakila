<%@ page import="sakila.Inventory" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'inventory.label', default: 'Inventory')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-inventory" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-inventory" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list inventory">

        <g:if test="${inventoryInstance?.film}">
            <li class="fieldcontain">
                <span id="film-label" class="property-label"><g:message code="inventory.film.label"
                                                                        default="Film"/></span>

                <span class="property-value" aria-labelledby="film-label"><g:link controller="film" action="show"
                                                                                  id="${inventoryInstance?.film?.id}">${inventoryInstance?.film?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${inventoryInstance?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="inventory.lastUpdated.label"
                                                                               default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
                        date="${inventoryInstance?.lastUpdated}"/></span>

            </li>
        </g:if>

        <g:if test="${inventoryInstance?.rentals}">
            <li class="fieldcontain">
                <span id="rentals-label" class="property-label"><g:message code="inventory.rentals.label"
                                                                           default="Rentals"/></span>

                <g:each in="${inventoryInstance.rentals}" var="r">
                    <span class="property-value" aria-labelledby="rentals-label"><g:link controller="rental"
                                                                                         action="show"
                                                                                         id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${inventoryInstance?.store}">
            <li class="fieldcontain">
                <span id="store-label" class="property-label"><g:message code="inventory.store.label"
                                                                         default="Store"/></span>

                <span class="property-value" aria-labelledby="store-label"><g:link controller="store" action="show"
                                                                                   id="${inventoryInstance?.store?.id}">${inventoryInstance?.store?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: inventoryInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${inventoryInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
