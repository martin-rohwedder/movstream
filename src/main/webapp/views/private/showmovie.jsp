<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:choose>
    <c:when test="${not empty movie}">

        <h1 class="page-header"><c:out value="${movie.title}" /></h1>

        <div id="video-player">
        
        <c:choose>
            <c:when test="${movie.movieFilename eq 'movieNotFound'}">
                <h2><spring:message code="page.showmovie.nomoviefile.label" />!</h2>
            </c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test="${externalMovie eq true}">
                        <video class="video-js vjs-default-skin" width="100%" height="450" data-setup='{"controls": true, "autoplay": false, "preload": "auto"}'>
                            <source src="<c:out value="${movie.movieFilename}" />" type='video/mp4' />
                            <c:forEach items="${movie.subtitles}" var="subtitle">
                                <track kind="subtitles" src="<c:out value="${pageContext.servletContext.contextPath}" /><c:out value="${subtitle.filename}" />" srclang="<c:out value="${subtitle.srcLang}" />" label="<c:out value="${subtitle.language}" />" />
                            </c:forEach>
                        </video>
                    </c:when>
                    <c:otherwise>
                        <video class="video-js vjs-default-skin" width="100%" height="450" data-setup='{"controls": true, "autoplay": false, "preload": "auto"}'>
                            <source src="<c:out value="${pageContext.servletContext.contextPath}" /><c:out value="${movie.movieFilename}" />" type='video/mp4' />
                            <c:forEach items="${movie.subtitles}" var="subtitle">
                                <track kind="subtitles" src="<c:out value="${pageContext.servletContext.contextPath}" /><c:out value="${subtitle.filename}" />" srclang="<c:out value="${subtitle.srcLang}" />" label="<c:out value="${subtitle.language}" />" />
                            </c:forEach>
                        </video>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>

        </div>
               
    </c:when>
    <c:otherwise>
        <p class="lead text-center"><spring:message code="page.showmovie.nomovie.label" /></p>
    </c:otherwise>
</c:choose>