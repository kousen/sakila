<%@ page import="sakila.Customer" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-customer" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-customer" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list customer">

        <g:if test="${customerInstance?.firstName}">
            <li class="fieldcontain">
                <span id="firstName-label" class="property-label"><g:message code="customer.firstName.label"
                                                                             default="First Name"/></span>

                <span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${customerInstance}"
                                                                                             field="firstName"/></span>

            </li>
        </g:if>

        <g:if test="${customerInstance?.lastName}">
            <li class="fieldcontain">
                <span id="lastName-label" class="property-label"><g:message code="customer.lastName.label"
                                                                            default="Last Name"/></span>

                <span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${customerInstance}"
                                                                                            field="lastName"/></span>

            </li>
        </g:if>

        <g:if test="${customerInstance?.email}">
            <li class="fieldcontain">
                <span id="email-label" class="property-label"><g:message code="customer.email.label"
                                                                         default="Email"/></span>

                <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${customerInstance}"
                                                                                         field="email"/></span>

            </li>
        </g:if>

        <g:if test="${customerInstance?.active}">
            <li class="fieldcontain">
                <span id="active-label" class="property-label"><g:message code="customer.active.label"
                                                                          default="Active"/></span>

                <span class="property-value" aria-labelledby="active-label"><g:formatBoolean
                        boolean="${customerInstance?.active}"/></span>

            </li>
        </g:if>

        <g:if test="${customerInstance?.address}">
            <li class="fieldcontain">
                <span id="address-label" class="property-label"><g:message code="customer.address.label"
                                                                           default="Address"/></span>

                <span class="property-value" aria-labelledby="address-label"><g:link controller="address" action="show"
                                                                                     id="${customerInstance?.address?.id}">${customerInstance?.address?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${customerInstance?.dateCreated}">
            <li class="fieldcontain">
                <span id="dateCreated-label" class="property-label"><g:message code="customer.dateCreated.label"
                                                                               default="Date Created"/></span>

                <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate
                        date="${customerInstance?.dateCreated}"/></span>

            </li>
        </g:if>

        <g:if test="${customerInstance?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="customer.lastUpdated.label"
                                                                               default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
                        date="${customerInstance?.lastUpdated}"/></span>

            </li>
        </g:if>

        <g:if test="${customerInstance?.payments}">
            <li class="fieldcontain">
                <span id="payments-label" class="property-label"><g:message code="customer.payments.label"
                                                                            default="Payments"/></span>

                <g:each in="${customerInstance.payments}" var="p">
                    <span class="property-value" aria-labelledby="payments-label"><g:link controller="payment"
                                                                                          action="show"
                                                                                          id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${customerInstance?.rentals}">
            <li class="fieldcontain">
                <span id="rentals-label" class="property-label"><g:message code="customer.rentals.label"
                                                                           default="Rentals"/></span>

                <g:each in="${customerInstance.rentals}" var="r">
                    <span class="property-value" aria-labelledby="rentals-label"><g:link controller="rental"
                                                                                         action="show"
                                                                                         id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${customerInstance?.store}">
            <li class="fieldcontain">
                <span id="store-label" class="property-label"><g:message code="customer.store.label"
                                                                         default="Store"/></span>

                <span class="property-value" aria-labelledby="store-label"><g:link controller="store" action="show"
                                                                                   id="${customerInstance?.store?.id}">${customerInstance?.store?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: customerInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${customerInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
