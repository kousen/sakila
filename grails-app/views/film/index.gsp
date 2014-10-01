<%@ page import="sakila.Film" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'film.label', default: 'Film')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-film" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-film" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="title" title="${message(code: 'film.title.label', default: 'Title')}"/>

            <g:sortableColumn property="description"
                              title="${message(code: 'film.description.label', default: 'Description')}"/>

            <g:sortableColumn property="releaseYear"
                              title="${message(code: 'film.releaseYear.label', default: 'Release Year')}"/>

            <g:sortableColumn property="length" title="${message(code: 'film.length.label', default: 'Length')}"/>

            <g:sortableColumn property="rating" title="${message(code: 'film.rating.label', default: 'Rating')}"/>

            <g:sortableColumn property="specialFeatures"
                              title="${message(code: 'film.specialFeatures.label', default: 'Special Features')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${filmInstanceList}" status="i" var="filmInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${filmInstance.id}">${fieldValue(bean: filmInstance, field: "title")}</g:link></td>

                <td>${fieldValue(bean: filmInstance, field: "description")}</td>

                <td>${fieldValue(bean: filmInstance, field: "releaseYear")}</td>

                <td>${fieldValue(bean: filmInstance, field: "length")}</td>

                <td>${fieldValue(bean: filmInstance, field: "rating")}</td>

                <td>${fieldValue(bean: filmInstance, field: "specialFeatures")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${filmInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
