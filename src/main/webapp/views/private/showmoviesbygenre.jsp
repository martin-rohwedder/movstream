<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:choose>
    <c:when test="${not empty movies}">

<h1 class="page-header"><c:out value="${movies.get(0).genre.title}" /></h1>

<p class="page-paragraph"><spring:message code="page.browsegenres.pagedescription.label" arguments="${movies.get(0).genre.title}" /></p>

<br /><br />

<ul class="thumbnails">
    <c:forEach items="${movies}" var="movie">
        
        <c:choose>
            <c:when test="${empty movie.season}">
                <li>
                    <div rel="popover" data-content="<p><c:out value="${movie.description}" /><br /><strong><spring:message code="overall.genre.label" />:</strong> <span class='text-info'><c:out value="${movie.genre.title}" /></span></p><a href='<c:out value="${pageContext.servletContext.contextPath}" />/movie/show/<c:out value="${movie.id}" />' class='btn btn-success btn-large btn-block'><i class='icon-play icon-white'></i> <spring:message code="overall.playmovie.button.label" /></a>" data-original-title="<c:out value="${movie.title}" />" class="thumbnail">
                        <c:choose>
                            <c:when test="${movie.pictureFilename eq 'pictureNotFound'}">
                                <img class="movie-img" src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/img/no-image-found.jpg" alt="" />
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${fn:startsWith(movie.pictureFilename, 'http')}">
                                        <img class="movie-img" src="<c:out value="${movie.pictureFilename}" />" alt="" />
                                    </c:when>
                                    <c:otherwise>
                                        <img class="movie-img" src="<c:out value="${pageContext.servletContext.contextPath}" /><c:out value="${movie.pictureFilename}" />" alt="" />
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
                        <p class="movie-title-thumbnail text-center"><c:out value="${movie.title}" /></p>
                    </div>
                </li>
            </c:when>
            <c:otherwise>
                <li>
                    <div rel="popover" data-content="<p><c:out value="${movie.season.description}" /><br /><strong><spring:message code="overall.genre.label" />:</strong> <span class='text-info'><c:out value="${movie.genre.title}" /></span></p><a href='<c:out value="${pageContext.servletContext.contextPath}" />/season/showepisodes/<c:out value="${movie.season.id}" />' class='btn btn-success btn-large btn-block'><i class='icon-share-alt icon-white'></i> <spring:message code="overall.showepisodes.button.label" /></a>" data-original-title="<c:out value="${movie.season.title}" />" class="thumbnail">
                        <c:choose>
                            <c:when test="${movie.pictureFilename eq 'pictureNotFound'}">
                                <img class="movie-img" src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/img/no-image-found.jpg" alt="" />
                            </c:when>
                            <c:otherwise>
                                <img class="movie-img" src="<c:out value="${pageContext.servletContext.contextPath}" /><c:out value="${movie.pictureFilename}" />" alt="" />
                            </c:otherwise>
                        </c:choose>
                        <p class="movie-title-thumbnail text-center"><c:out value="${movie.season.title}" /></p>
                    </div>
                </li>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</ul>

<script type="text/javascript">
    $(document).ready(function(){
        $('.thumbnail').popover({
            placement: 'top',
            delay: 300,
            html: true
        }, 'show'); 
    });
</script>

</c:when>
<c:otherwise>
    <p class="lead text-center"><spring:message code="page.browsegenres.nomovies.label" /></p>
</c:otherwise>
</c:choose>