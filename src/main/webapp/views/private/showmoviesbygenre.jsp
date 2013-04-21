<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class="page-header"><c:out value="${movies.get(0).genre.title}" /></h1>

<p class="page-paragraph">In the list of movies below, you can choose which one you want to watch from the movie genre '<c:out value="${movies.get(0).genre.title}" />'.</p>

<br /><br />

<ul class="thumbnails">
    <c:forEach items="${movies}" var="movie">
        
        <c:choose>
            <c:when test="${empty movie.season}">
                <li>
                    <div rel="popover" data-content="<p><c:out value="${movie.description}" /><br /><strong>Genre:</strong> <span class='text-info'><c:out value="${movie.genre.title}" /></span></p><a href='<c:out value="${pageContext.servletContext.contextPath}" />/movie/show/<c:out value="${movie.id}" />' class='btn btn-success btn-large btn-block'><i class='icon-play icon-white'></i> Play Movie</a>" data-original-title="<c:out value="${movie.title}" />" class="thumbnail">
                        <img src="http://placehold.it/160x200" alt="" />
                        <p class="text-center"><c:out value="${movie.title}" /></p>
                    </div>
                </li>
            </c:when>
            <c:otherwise>
                <li>
                    <div rel="popover" data-content="<p><c:out value="${movie.season.description}" /><br /><strong>Genre:</strong> <span class='text-info'><c:out value="${movie.genre.title}" /></span></p><a href='<c:out value="${pageContext.servletContext.contextPath}" />/season/showepisodes/<c:out value="${movie.season.id}" />' class='btn btn-success btn-large btn-block'><i class='icon-share-alt icon-white'></i> Show Episodes</a>" data-original-title="<c:out value="${movie.title}" />" class="thumbnail">
                        <img src="http://placehold.it/160x200" alt="" />
                        <p class="text-center"><c:out value="${movie.season.title}" /></p>
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