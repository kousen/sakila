<%@ page import="sakila.Film" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'film.label', default: 'Film')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-film" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-film" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list film">

        <g:if test="${filmInstance?.title}">
            <li class="fieldcontain">
                <span id="title-label" class="property-label"><g:message code="film.title.label"
                                                                         default="Title"/></span>

                <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${filmInstance}"
                                                                                         field="title"/></span>

            </li>
        </g:if>

        <g:if test="${filmInstance?.description}">
            <li class="fieldcontain">
                <span id="description-label" class="property-label"><g:message code="film.description.label"
                                                                               default="Description"/></span>

                <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${filmInstance}"
                                                                                               field="description"/></span>

            </li>
        </g:if>

        <g:if test="${filmInstance?.releaseYear}">
            <li class="fieldcontain">
                <span id="releaseYear-label" class="property-label"><g:message code="film.releaseYear.label"
                                                                               default="Release Year"/></span>

                <span class="property-value" aria-labelledby="releaseYear-label"><g:fieldValue bean="${filmInstance}"
                                                                                               field="releaseYear"/></span>

            </li>
        </g:if>

        <g:if test="${filmInstance?.length}">
            <li class="fieldcontain">
                <span id="length-label" class="property-label"><g:message code="film.length.label"
                                                                          default="Length"/></span>

                <span class="property-value" aria-labelledby="length-label"><g:fieldValue bean="${filmInstance}"
                                                                                          field="length"/></span>

            </li>
        </g:if>

        <g:if test="${filmInstance?.rating}">
            <li class="fieldcontain">
                <span id="rating-label" class="property-label"><g:message code="film.rating.label"
                                                                          default="Rating"/></span>

                <span class="property-value" aria-labelledby="rating-label"><g:fieldValue bean="${filmInstance}"
                                                                                          field="rating"/></span>

            </li>
        </g:if>

        <g:if test="${filmInstance?.specialFeatures}">
            <li class="fieldcontain">
                <span id="specialFeatures-label" class="property-label"><g:message code="film.specialFeatures.label"
                                                                                   default="Special Features"/></span>

                <span class="property-value" aria-labelledby="specialFeatures-label"><g:fieldValue
                        bean="${filmInstance}" field="specialFeatures"/></span>

            </li>
        </g:if>

        <g:if test="${filmInstance?.actors}">
            <li class="fieldcontain">
                <span id="actors-label" class="property-label"><g:message code="film.actors.label"
                                                                          default="Actors"/></span>

                <g:each in="${filmInstance.actors}" var="a">
                    <span class="property-value" aria-labelledby="actors-label"><g:link controller="actor" action="show"
                                                                                        id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${filmInstance?.categories}">
            <li class="fieldcontain">
                <span id="categories-label" class="property-label"><g:message code="film.categories.label"
                                                                              default="Categories"/></span>

                <g:each in="${filmInstance.categories}" var="c">
                    <span class="property-value" aria-labelledby="categories-label"><g:link controller="category"
                                                                                            action="show"
                                                                                            id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${filmInstance?.inventories}">
            <li class="fieldcontain">
                <span id="inventories-label" class="property-label"><g:message code="film.inventories.label"
                                                                               default="Inventories"/></span>

                <g:each in="${filmInstance.inventories}" var="i">
                    <span class="property-value" aria-labelledby="inventories-label"><g:link controller="inventory"
                                                                                             action="show"
                                                                                             id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${filmInstance?.language}">
            <li class="fieldcontain">
                <span id="language-label" class="property-label"><g:message code="film.language.label"
                                                                            default="Language"/></span>

                <span class="property-value" aria-labelledby="language-label"><g:link controller="language"
                                                                                      action="show"
                                                                                      id="${filmInstance?.language?.id}">${filmInstance?.language?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${filmInstance?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="film.lastUpdated.label"
                                                                               default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
                        date="${filmInstance?.lastUpdated}"/></span>

            </li>
        </g:if>

        <g:if test="${filmInstance?.originalLanguage}">
            <li class="fieldcontain">
                <span id="originalLanguage-label" class="property-label"><g:message code="film.originalLanguage.label"
                                                                                    default="Original Language"/></span>

                <span class="property-value" aria-labelledby="originalLanguage-label"><g:link controller="language"
                                                                                              action="show"
                                                                                              id="${filmInstance?.originalLanguage?.id}">${filmInstance?.originalLanguage?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${filmInstance?.rentalDuration}">
            <li class="fieldcontain">
                <span id="rentalDuration-label" class="property-label"><g:message code="film.rentalDuration.label"
                                                                                  default="Rental Duration"/></span>

                <span class="property-value" aria-labelledby="rentalDuration-label"><g:fieldValue bean="${filmInstance}"
                                                                                                  field="rentalDuration"/></span>

            </li>
        </g:if>

        <g:if test="${filmInstance?.rentalRate}">
            <li class="fieldcontain">
                <span id="rentalRate-label" class="property-label"><g:message code="film.rentalRate.label"
                                                                              default="Rental Rate"/></span>

                <span class="property-value" aria-labelledby="rentalRate-label"><g:fieldValue bean="${filmInstance}"
                                                                                              field="rentalRate"/></span>

            </li>
        </g:if>

        <g:if test="${filmInstance?.replacementCost}">
            <li class="fieldcontain">
                <span id="replacementCost-label" class="property-label"><g:message code="film.replacementCost.label"
                                                                                   default="Replacement Cost"/></span>

                <span class="property-value" aria-labelledby="replacementCost-label"><g:fieldValue
                        bean="${filmInstance}" field="replacementCost"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: filmInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${filmInstance}"><g:message code="default.button.edit.label"
                                                                                     default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
