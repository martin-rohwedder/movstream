<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="flow-container">

    <h3><spring:message code="flow.newmovie.page5.pagetitle.label" /></h3>

    <div class="span8">

        <p class="muted"><spring:message code="flow.newmovie.page5.pagedescription.label" /></p>

        <dl class="dl-horizontal">
            <dt><spring:message code="flow.newmovie.page5.details.title.label" /></dt>
            <dd><c:out value="${movieForm.title}" /></dd>
            <dt><spring:message code="flow.newmovie.page5.details.genre.label" /></dt>
            <dd><c:out value="${movieForm.genre.title}" /></dd>
            <dt><spring:message code="flow.newmovie.page5.details.description.label" /></dt>
            <dd><c:out value="${movieForm.description}" /></dd>
            <dt><spring:message code="flow.newmovie.page5.details.season.label" /></dt>
            <dd>
                <c:choose>
                    <c:when test="${empty movieForm.season}">
                        <spring:message code="flow.newmovie.page5.details.noseason.label" />
                    </c:when>
                    <c:otherwise>
                        <c:out value="${movieForm.season.title}" /><br />
                        <c:out value="${movieForm.season.description}" />
                    </c:otherwise>
                </c:choose>
            </dd>
            <dt><spring:message code="flow.newmovie.page5.details.moviefilename.label" /></dt>
            <dd><c:out value="${movieForm.movieFilename}" />.<c:out value="${movieForm.movieType.name}" /></dd>
            <dt><spring:message code="flow.newmovie.page5.details.picturefilename.label" /></dt>
            <dd><c:out value="${movieForm.pictureFilename}" /></dd>
            <dt><spring:message code="flow.newmovie.page5.details.subtitle.label" /></dt>
            <dd>
                <c:choose>
                    <c:when test="${empty movieForm.subtitles}">
                        <spring:message code="flow.newmovie.page5.details.nosubtitle.label" />
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${movieForm.subtitles}" var="subtitle">
                            <c:out value="${subtitle.filename}.vtt (${subtitle.language})" /><br />
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </dd>
        </dl>
            
    </div>
            
</div>

<form:form modelAttribute="movieForm" action="${flowExecutionUrl}" class="clearfix">
    <div class="control-group">
        <div class="controls">
            <button type="submit" class="btn btn-info pull-left" id="back" name="_eventId_back"><i class="icon-arrow-left icon-white"></i> <strong><spring:message code="overall.flow.button.back.label" /></strong></button>
            <div class="pull-right">
                <sec:authorize access="hasRole('ROLE_TEST')">
                <button type="submit" disabled="disbaled" class="btn btn-success" id="savemovie" name="_eventId_savemovie"><i class="icon-ok-circle icon-white"></i> <strong><spring:message code="flow.newmovie.page5.form.button.savemovie.label" /></strong></button>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_SUPERADMIN') or hasRole('ROLE_ADMIN')">
                <button type="submit" class="btn btn-success" id="savemovie" name="_eventId_savemovie"><i class="icon-ok-circle icon-white"></i> <strong><spring:message code="flow.newmovie.page5.form.button.savemovie.label" /></strong></button>
                </sec:authorize>
            </div>
        </div>
    </div>
</form:form>
            
<div>
    <hr />
        
    <p class="muted text-center"><spring:message code="overall.flow.steps.label" arguments="5,5" argumentSeparator="," /></p>
        
    <div class="progress progress-striped active">
        <div class="bar" data-percentage="100"></div>
    </div>
    
    <br />
</div>

<script type="text/javascript">
$(document).ready(function() {
    $('.progress .bar').progressbar({
        transition_delay: 400,
        display_text: 1
    });
});
</script>
