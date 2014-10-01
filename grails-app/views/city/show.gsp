<%@ page import="sakila.City" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'city.label', default: 'City')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-city" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-city" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list city">

        <g:if test="${cityInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="city.name.label" default="Name"/></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${cityInstance}"
                                                                                        field="name"/></span>

            </li>
        </g:if>

        <g:if test="${cityInstance?.addresses}">
            <li class="fieldcontain">
                <span id="addresses-label" class="property-label"><g:message code="city.addresses.label"
                                                                             default="Addresses"/></span>

                <g:each in="${cityInstance.addresses}" var="a">
                    <span class="property-value" aria-labelledby="addresses-label"><g:link controller="address"
                                                                                           action="show"
                                                                                           id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${cityInstance?.country}">
            <li class="fieldcontain">
                <span id="country-label" class="property-label"><g:message code="city.country.label"
                                                                           default="Country"/></span>

                <span class="property-value" aria-labelledby="country-label"><g:link controller="country" action="show"
                                                                                     id="${cityInstance?.country?.id}">${cityInstance?.country?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${cityInstance?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="city.lastUpdated.label"
                                                                               default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
                        date="${cityInstance?.lastUpdated}"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: cityInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${cityInstance}"><g:message code="default.button.edit.label"
                                                                                     default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
