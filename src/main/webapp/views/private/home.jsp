<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h1 class="page-header"><spring:message code="page.home.pagetitle.label" /></h1>

<c:if test="${param.passwordChanged == 3}">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong><spring:message code="overall.congratulations.label" />!</strong> <spring:message code="page.home.successbox.message.newpassword.label" /></p>
    </div>
</c:if>

<p class="page-paragraph"><spring:message code="page.home.pagedescription.label" /></p>

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

<c:if test="${changePasswordDialog eq true}">
    <form method="post" action="<c:out value="${pageContext.servletContext.contextPath}" />/user/changePasswordFirstTime.do">
        <div id="change-password-modal" class="modal hide fade">
            <div class="modal-header">
                <h3><spring:message code="page.home.dialog.changepassword.title" /></h3>
            </div>
            <div class="modal-body">
                <p><spring:message code="page.home.dialog.changepassword.message" />.</p>

                <input type="hidden" name="oldPassword" value="default" />
                    
                <c:choose>
                    <c:when test="${param.passwordChanged == 1}">
                        <div class="alert alert-error">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <p><strong><spring:message code="overall.error.label" />!</strong> <spring:message code="overall.error.message.password.minchars" /></p>
                        </div>
                        
                        <div class="control-group error">
                            <label class="control-label" for="inputNewPassword"><spring:message code="overall.newpassword.label" /></label>
                            <div class="controls">
                                <input class="span4" type="password" name="newPassword" id="inputNewPassword" placeholder="<spring:message code="overall.newpassword.label" />">
                            </div>
                        </div>
        
                        <div class="control-group error">
                            <label class="control-label" for="inputRepeatNewPassword"><spring:message code="overall.repeatnewpassword.label" /></label>
                            <div class="controls">
                                <input class="span4" type="password" name="repeatNewPassword" id="inputRepeatNewPassword" placeholder="<spring:message code="overall.repeatnewpassword.label" />">
                            </div>
                        </div>
                    </c:when>
                    <c:when test="${param.passwordChanged == 2}">
                        <div class="alert alert-error">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <p><strong><spring:message code="overall.error.label" />!</strong> <spring:message code="overall.error.message.password.mismatch" /></p>
                        </div>
                        
                        <div class="control-group error">
                            <label class="control-label" for="inputNewPassword"><spring:message code="overall.newpassword.label" /></label>
                            <div class="controls">
                                <input class="span4" type="password" name="newPassword" id="inputNewPassword" placeholder="<spring:message code="overall.newpassword.label" />">
                            </div>
                        </div>
        
                        <div class="control-group error">
                            <label class="control-label" for="inputRepeatNewPassword"><spring:message code="overall.repeatnewpassword.label" /></label>
                            <div class="controls">
                                <input class="span4" type="password" name="repeatNewPassword" id="inputRepeatNewPassword" placeholder="<spring:message code="overall.repeatnewpassword.label" />">
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="control-group">
                            <label class="control-label" for="inputNewPassword"><spring:message code="overall.newpassword.label" /></label>
                            <div class="controls">
                                <input class="span4" type="password" name="newPassword" id="inputNewPassword" placeholder="<spring:message code="overall.newpassword.label" />">
                            </div>
                        </div>
        
                        <div class="control-group">
                            <label class="control-label" for="inputRepeatNewPassword"><spring:message code="overall.repeatnewpassword.label" /></label>
                            <div class="controls">
                                <input class="span4" type="password" name="repeatNewPassword" id="inputRepeatNewPassword" placeholder="<spring:message code="overall.repeatnewpassword.label" />">
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-info"><spring:message code="page.home.dialog.changepassword.button" /></button>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        $(document).ready(function(){
            $('#change-password-modal').modal({
                backdrop: 'static',
                show: true,
                keyboard: false
            }); 
        });
    </script>
</c:if>
