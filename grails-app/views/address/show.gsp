<%@ page import="sakila.Address" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-address" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-address" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list address">

        <g:if test="${addressInstance?.street1}">
            <li class="fieldcontain">
                <span id="street1-label" class="property-label"><g:message code="address.street1.label"
                                                                           default="Street1"/></span>

                <span class="property-value" aria-labelledby="street1-label"><g:fieldValue bean="${addressInstance}"
                                                                                           field="street1"/></span>

            </li>
        </g:if>

        <g:if test="${addressInstance?.street2}">
            <li class="fieldcontain">
                <span id="street2-label" class="property-label"><g:message code="address.street2.label"
                                                                           default="Street2"/></span>

                <span class="property-value" aria-labelledby="street2-label"><g:fieldValue bean="${addressInstance}"
                                                                                           field="street2"/></span>

            </li>
        </g:if>

        <g:if test="${addressInstance?.district}">
            <li class="fieldcontain">
                <span id="district-label" class="property-label"><g:message code="address.district.label"
                                                                            default="District"/></span>

                <span class="property-value" aria-labelledby="district-label"><g:fieldValue bean="${addressInstance}"
                                                                                            field="district"/></span>

            </li>
        </g:if>

        <g:if test="${addressInstance?.postalCode}">
            <li class="fieldcontain">
                <span id="postalCode-label" class="property-label"><g:message code="address.postalCode.label"
                                                                              default="Postal Code"/></span>

                <span class="property-value" aria-labelledby="postalCode-label"><g:fieldValue bean="${addressInstance}"
                                                                                              field="postalCode"/></span>

            </li>
        </g:if>

        <g:if test="${addressInstance?.phone}">
            <li class="fieldcontain">
                <span id="phone-label" class="property-label"><g:message code="address.phone.label"
                                                                         default="Phone"/></span>

                <span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${addressInstance}"
                                                                                         field="phone"/></span>

            </li>
        </g:if>

        <g:if test="${addressInstance?.city}">
            <li class="fieldcontain">
                <span id="city-label" class="property-label"><g:message code="address.city.label"
                                                                        default="City"/></span>

                <span class="property-value" aria-labelledby="city-label"><g:link controller="city" action="show"
                                                                                  id="${addressInstance?.city?.id}">${addressInstance?.city?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${addressInstance?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="address.lastUpdated.label"
                                                                               default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
                        date="${addressInstance?.lastUpdated}"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: addressInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${addressInstance}"><g:message code="default.button.edit.label"
                                                                                        default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
