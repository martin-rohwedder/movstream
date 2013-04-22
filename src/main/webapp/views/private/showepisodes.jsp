<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${empty episodes}">
        <p class="lead">No episodes was found</p>
    </c:when>
    <c:otherwise>

<c:set var="episodeNumber" value="0" scope="page" />

<h1 class="page-header"><c:out value="${episodes.get(0).season.title}" /></h1>

<p>Select the episode, from the table below, which you want to watch.</p>

<table class="table table-striped">
    <thead>
        <tr>
            <th>#</th>
            <th>Episode Title</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${episodes}" var="episode">
            
        <c:set var="episodeNumber" value="${episodeNumber + 1}" scope="page" />
            
        <tr>
            <td><c:out value="${episodeNumber}" /></td>
            <td><c:out value="${episode.title}" /></td>
            <td style="text-align: right;"><a href="<c:out value="${pageContext.servletContext.contextPath}" />/movie/show/<c:out value="${episode.id}" />" class="btn btn-primary"><i class="icon-play-circle icon-white"></i> Play Episode</a></td>
        </tr>
        </c:forEach>
    </tbody>
</table>

    </c:otherwise>
</c:choose>