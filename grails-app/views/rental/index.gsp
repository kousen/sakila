<%@ page import="sakila.Rental" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'rental.label', default: 'Rental')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-rental" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-rental" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="rentalDate"
                              title="${message(code: 'rental.rentalDate.label', default: 'Rental Date')}"/>

            <g:sortableColumn property="returnDate"
                              title="${message(code: 'rental.returnDate.label', default: 'Return Date')}"/>

            <th><g:message code="rental.customer.label" default="Customer"/></th>

            <th><g:message code="rental.inventory.label" default="Inventory"/></th>

            <g:sortableColumn property="lastUpdated"
                              title="${message(code: 'rental.lastUpdated.label', default: 'Last Updated')}"/>

            <th><g:message code="rental.staff.label" default="Staff"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${rentalInstanceList}" status="i" var="rentalInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${rentalInstance.id}">${fieldValue(bean: rentalInstance, field: "rentalDate")}</g:link></td>

                <td><g:formatDate date="${rentalInstance.returnDate}"/></td>

                <td>${fieldValue(bean: rentalInstance, field: "customer")}</td>

                <td>${fieldValue(bean: rentalInstance, field: "inventory")}</td>

                <td><g:formatDate date="${rentalInstance.lastUpdated}"/></td>

                <td>${fieldValue(bean: rentalInstance, field: "staff")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${rentalInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
