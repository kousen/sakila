<%@ page import="sakila.Customer" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-customer" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-customer" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="firstName"
                              title="${message(code: 'customer.firstName.label', default: 'First Name')}"/>

            <g:sortableColumn property="lastName"
                              title="${message(code: 'customer.lastName.label', default: 'Last Name')}"/>

            <g:sortableColumn property="email" title="${message(code: 'customer.email.label', default: 'Email')}"/>

            <g:sortableColumn property="active" title="${message(code: 'customer.active.label', default: 'Active')}"/>

            <th><g:message code="customer.address.label" default="Address"/></th>

            <g:sortableColumn property="dateCreated"
                              title="${message(code: 'customer.dateCreated.label', default: 'Date Created')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${customerInstanceList}" status="i" var="customerInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${customerInstance.id}">${fieldValue(bean: customerInstance, field: "firstName")}</g:link></td>

                <td>${fieldValue(bean: customerInstance, field: "lastName")}</td>

                <td>${fieldValue(bean: customerInstance, field: "email")}</td>

                <td><g:formatBoolean boolean="${customerInstance.active}"/></td>

                <td>${fieldValue(bean: customerInstance, field: "address")}</td>

                <td><g:formatDate date="${customerInstance.dateCreated}"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${customerInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
