<%@ page import="sakila.Payment" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-payment" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-payment" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list payment">

        <g:if test="${paymentInstance?.amount}">
            <li class="fieldcontain">
                <span id="amount-label" class="property-label"><g:message code="payment.amount.label"
                                                                          default="Amount"/></span>

                <span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${paymentInstance}"
                                                                                          field="amount"/></span>

            </li>
        </g:if>

        <g:if test="${paymentInstance?.customer}">
            <li class="fieldcontain">
                <span id="customer-label" class="property-label"><g:message code="payment.customer.label"
                                                                            default="Customer"/></span>

                <span class="property-value" aria-labelledby="customer-label"><g:link controller="customer"
                                                                                      action="show"
                                                                                      id="${paymentInstance?.customer?.id}">${paymentInstance?.customer?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${paymentInstance?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="payment.lastUpdated.label"
                                                                               default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
                        date="${paymentInstance?.lastUpdated}"/></span>

            </li>
        </g:if>

        <g:if test="${paymentInstance?.paymentDate}">
            <li class="fieldcontain">
                <span id="paymentDate-label" class="property-label"><g:message code="payment.paymentDate.label"
                                                                               default="Payment Date"/></span>

                <span class="property-value" aria-labelledby="paymentDate-label"><g:formatDate
                        date="${paymentInstance?.paymentDate}"/></span>

            </li>
        </g:if>

        <g:if test="${paymentInstance?.rental}">
            <li class="fieldcontain">
                <span id="rental-label" class="property-label"><g:message code="payment.rental.label"
                                                                          default="Rental"/></span>

                <span class="property-value" aria-labelledby="rental-label"><g:link controller="rental" action="show"
                                                                                    id="${paymentInstance?.rental?.id}">${paymentInstance?.rental?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${paymentInstance?.staff}">
            <li class="fieldcontain">
                <span id="staff-label" class="property-label"><g:message code="payment.staff.label"
                                                                         default="Staff"/></span>

                <span class="property-value" aria-labelledby="staff-label"><g:link controller="staff" action="show"
                                                                                   id="${paymentInstance?.staff?.id}">${paymentInstance?.staff?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: paymentInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${paymentInstance}"><g:message code="default.button.edit.label"
                                                                                        default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
