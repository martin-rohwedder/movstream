<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${not empty movie}">

<h1 class="page-header"><c:out value="${movie.title}" /></h1>

<video id="video-player" class="video-js vjs-default-skin" controls preload="none" width="700" height="450" data-setup="{}">
    <source src="http://video-js.zencoder.com/oceans-clip.mp4" type='video/mp4' />
    <c:forEach items="${movie.subtitles}" var="subtitle">
        <track kind="subtitles" src="<c:out value="${subtitle.filename}" />" srclang="<c:out value="${subtitle.srcLang}" />" label="<c:out value="${subtitle.language}" />" />
    </c:forEach>
</video>

    </c:when>
    <c:otherwise>
        <p class="lead">No movie was found</p>
    </c:otherwise>
</c:choose>