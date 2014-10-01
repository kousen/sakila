<%@ page import="sakila.Staff" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'staff.label', default: 'Staff')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-staff" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-staff" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list staff">

        <g:if test="${staffInstance?.firstName}">
            <li class="fieldcontain">
                <span id="firstName-label" class="property-label"><g:message code="staff.firstName.label"
                                                                             default="First Name"/></span>

                <span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${staffInstance}"
                                                                                             field="firstName"/></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.lastName}">
            <li class="fieldcontain">
                <span id="lastName-label" class="property-label"><g:message code="staff.lastName.label"
                                                                            default="Last Name"/></span>

                <span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${staffInstance}"
                                                                                            field="lastName"/></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.picture}">
            <li class="fieldcontain">
                <span id="picture-label" class="property-label"><g:message code="staff.picture.label"
                                                                           default="Picture"/></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.email}">
            <li class="fieldcontain">
                <span id="email-label" class="property-label"><g:message code="staff.email.label"
                                                                         default="Email"/></span>

                <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${staffInstance}"
                                                                                         field="email"/></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.password}">
            <li class="fieldcontain">
                <span id="password-label" class="property-label"><g:message code="staff.password.label"
                                                                            default="Password"/></span>

                <span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${staffInstance}"
                                                                                            field="password"/></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.active}">
            <li class="fieldcontain">
                <span id="active-label" class="property-label"><g:message code="staff.active.label"
                                                                          default="Active"/></span>

                <span class="property-value" aria-labelledby="active-label"><g:formatBoolean
                        boolean="${staffInstance?.active}"/></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.address}">
            <li class="fieldcontain">
                <span id="address-label" class="property-label"><g:message code="staff.address.label"
                                                                           default="Address"/></span>

                <span class="property-value" aria-labelledby="address-label"><g:link controller="address" action="show"
                                                                                     id="${staffInstance?.address?.id}">${staffInstance?.address?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="staff.lastUpdated.label"
                                                                               default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
                        date="${staffInstance?.lastUpdated}"/></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.payments}">
            <li class="fieldcontain">
                <span id="payments-label" class="property-label"><g:message code="staff.payments.label"
                                                                            default="Payments"/></span>

                <g:each in="${staffInstance.payments}" var="p">
                    <span class="property-value" aria-labelledby="payments-label"><g:link controller="payment"
                                                                                          action="show"
                                                                                          id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${staffInstance?.rentals}">
            <li class="fieldcontain">
                <span id="rentals-label" class="property-label"><g:message code="staff.rentals.label"
                                                                           default="Rentals"/></span>

                <g:each in="${staffInstance.rentals}" var="r">
                    <span class="property-value" aria-labelledby="rentals-label"><g:link controller="rental"
                                                                                         action="show"
                                                                                         id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${staffInstance?.store}">
            <li class="fieldcontain">
                <span id="store-label" class="property-label"><g:message code="staff.store.label"
                                                                         default="Store"/></span>

                <span class="property-value" aria-labelledby="store-label"><g:link controller="store" action="show"
                                                                                   id="${staffInstance?.store?.id}">${staffInstance?.store?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.userName}">
            <li class="fieldcontain">
                <span id="userName-label" class="property-label"><g:message code="staff.userName.label"
                                                                            default="User Name"/></span>

                <span class="property-value" aria-labelledby="userName-label"><g:fieldValue bean="${staffInstance}"
                                                                                            field="userName"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: staffInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${staffInstance}"><g:message code="default.button.edit.label"
                                                                                      default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
