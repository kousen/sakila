<%@ page import="sakila.Store" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'store.label', default: 'Store')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-store" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-store" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list store">

        <g:if test="${storeInstance?.address}">
            <li class="fieldcontain">
                <span id="address-label" class="property-label"><g:message code="store.address.label"
                                                                           default="Address"/></span>

                <span class="property-value" aria-labelledby="address-label"><g:link controller="address" action="show"
                                                                                     id="${storeInstance?.address?.id}">${storeInstance?.address?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${storeInstance?.customers}">
            <li class="fieldcontain">
                <span id="customers-label" class="property-label"><g:message code="store.customers.label"
                                                                             default="Customers"/></span>

                <g:each in="${storeInstance.customers}" var="c">
                    <span class="property-value" aria-labelledby="customers-label"><g:link controller="customer"
                                                                                           action="show"
                                                                                           id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${storeInstance?.inventories}">
            <li class="fieldcontain">
                <span id="inventories-label" class="property-label"><g:message code="store.inventories.label"
                                                                               default="Inventories"/></span>

                <g:each in="${storeInstance.inventories}" var="i">
                    <span class="property-value" aria-labelledby="inventories-label"><g:link controller="inventory"
                                                                                             action="show"
                                                                                             id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${storeInstance?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="store.lastUpdated.label"
                                                                               default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
                        date="${storeInstance?.lastUpdated}"/></span>

            </li>
        </g:if>

        <g:if test="${storeInstance?.manager}">
            <li class="fieldcontain">
                <span id="manager-label" class="property-label"><g:message code="store.manager.label"
                                                                           default="Manager"/></span>

                <span class="property-value" aria-labelledby="manager-label"><g:link controller="staff" action="show"
                                                                                     id="${storeInstance?.manager?.id}">${storeInstance?.manager?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: storeInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${storeInstance}"><g:message code="default.button.edit.label"
                                                                                      default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
