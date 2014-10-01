<%@ page import="sakila.Store" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'store.label', default: 'Store')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-store" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-store" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="store.address.label" default="Address"/></th>

            <g:sortableColumn property="lastUpdated"
                              title="${message(code: 'store.lastUpdated.label', default: 'Last Updated')}"/>

            <th><g:message code="store.manager.label" default="Manager"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${storeInstanceList}" status="i" var="storeInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${storeInstance.id}">${fieldValue(bean: storeInstance, field: "address")}</g:link></td>

                <td><g:formatDate date="${storeInstance.lastUpdated}"/></td>

                <td>${fieldValue(bean: storeInstance, field: "manager")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${storeInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
