<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class="page-header">All Movies</h1>

<p class="page-paragraph">Here is listed all the current availible movies in alphabetical order. If you want to filter the list of movies by genre, please select the genre at the top of the page. You can also do a search on a movie title or a part of it, by using the search box.</p>

<c:forEach items="${movies}" var="listOfMovies">

    <c:choose>
        <c:when test="${listOfMovies.get(0).title.substring(0, 1).matches('[0-9]')}">
            <h3 class="muted">0-9</h3>
            <hr />
        </c:when>
        <c:otherwise>
            <h3 class="muted"><c:out value="${listOfMovies.get(0).title.substring(0, 1)}" /></h3>
        <hr />
        </c:otherwise>
    </c:choose>
    
    <ul class="thumbnails">
    <c:forEach items="${listOfMovies}" var="movie">
        
        <c:choose>
            <c:when test="${empty movie.season}">
                <li>
                    <div rel="popover" data-content="<p><c:out value="${movie.description}" /></p><a href='<c:out value="${pageContext.servletContext.contextPath}" />/movie/show/<c:out value="${movie.id}" />' class='btn btn-success btn-large btn-block'><i class='icon-play icon-white'></i> Play Movie</a>" data-original-title="<c:out value="${movie.title}" />" class="thumbnail">
                        <img src="http://placehold.it/160x200" alt="" />
                        <p class="text-center"><c:out value="${movie.title}" /></p>
                    </div>
                </li>
            </c:when>
            <c:otherwise>
                <li>
                    <div rel="popover" data-content="<p><c:out value="${movie.season.description}" /></p><a href='<c:out value="${pageContext.servletContext.contextPath}" />/season/showepisodes/<c:out value="${movie.season.id}" />' class='btn btn-success btn-large btn-block'><i class='icon-share-alt icon-white'></i> Show Episodes</a>" data-original-title="<c:out value="${movie.title}" />" class="thumbnail">
                        <img src="http://placehold.it/160x200" alt="" />
                        <p class="text-center"><c:out value="${movie.season.title}" /></p>
                    </div>
                </li>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    </ul>
    
</c:forEach>

<script type="text/javascript">
    $(document).ready(function(){
        $('.thumbnail').popover({
            placement: 'top',
            delay: 300,
            html: true
        }, 'show'); 
    });
</script>
