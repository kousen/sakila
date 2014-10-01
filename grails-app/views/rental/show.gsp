<%@ page import="sakila.Rental" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'rental.label', default: 'Rental')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-rental" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-rental" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list rental">

        <g:if test="${rentalInstance?.rentalDate}">
            <li class="fieldcontain">
                <span id="rentalDate-label" class="property-label"><g:message code="rental.rentalDate.label"
                                                                              default="Rental Date"/></span>

                <span class="property-value" aria-labelledby="rentalDate-label"><g:formatDate
                        date="${rentalInstance?.rentalDate}"/></span>

            </li>
        </g:if>

        <g:if test="${rentalInstance?.returnDate}">
            <li class="fieldcontain">
                <span id="returnDate-label" class="property-label"><g:message code="rental.returnDate.label"
                                                                              default="Return Date"/></span>

                <span class="property-value" aria-labelledby="returnDate-label"><g:formatDate
                        date="${rentalInstance?.returnDate}"/></span>

            </li>
        </g:if>

        <g:if test="${rentalInstance?.customer}">
            <li class="fieldcontain">
                <span id="customer-label" class="property-label"><g:message code="rental.customer.label"
                                                                            default="Customer"/></span>

                <span class="property-value" aria-labelledby="customer-label"><g:link controller="customer"
                                                                                      action="show"
                                                                                      id="${rentalInstance?.customer?.id}">${rentalInstance?.customer?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${rentalInstance?.inventory}">
            <li class="fieldcontain">
                <span id="inventory-label" class="property-label"><g:message code="rental.inventory.label"
                                                                             default="Inventory"/></span>

                <span class="property-value" aria-labelledby="inventory-label"><g:link controller="inventory"
                                                                                       action="show"
                                                                                       id="${rentalInstance?.inventory?.id}">${rentalInstance?.inventory?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${rentalInstance?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="rental.lastUpdated.label"
                                                                               default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
                        date="${rentalInstance?.lastUpdated}"/></span>

            </li>
        </g:if>

        <g:if test="${rentalInstance?.payments}">
            <li class="fieldcontain">
                <span id="payments-label" class="property-label"><g:message code="rental.payments.label"
                                                                            default="Payments"/></span>

                <g:each in="${rentalInstance.payments}" var="p">
                    <span class="property-value" aria-labelledby="payments-label"><g:link controller="payment"
                                                                                          action="show"
                                                                                          id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${rentalInstance?.staff}">
            <li class="fieldcontain">
                <span id="staff-label" class="property-label"><g:message code="rental.staff.label"
                                                                         default="Staff"/></span>

                <span class="property-value" aria-labelledby="staff-label"><g:link controller="staff" action="show"
                                                                                   id="${rentalInstance?.staff?.id}">${rentalInstance?.staff?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: rentalInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${rentalInstance}"><g:message code="default.button.edit.label"
                                                                                       default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
