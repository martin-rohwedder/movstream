<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="flow-container">

    <h3>New Movie</h3>

    <div class="span8">

        <p class="muted">Inspect the details of the movie before saving in the database</p>

        <dl class="dl-horizontal">
            <dt>Title</dt>
            <dd><c:out value="${movieForm.title}" /></dd>
            <dt>Genre</dt>
            <dd><c:out value="${movieForm.genre.title} (${movieForm.genre.id})" /></dd>
            <dt>Description</dt>
            <dd><c:out value="${movieForm.description}" /></dd>
            <dt>Season</dt>
            <dd>
                <c:choose>
                    <c:when test="${empty movieForm.season}">
                        No Season associated
                    </c:when>
                    <c:otherwise>
                        <c:out value="${movieForm.season.title} (${movieForm.season.id})" /><br />
                        <c:out value="${movieForm.season.description}" />
                    </c:otherwise>
                </c:choose>
            </dd>
            <dt>Movie Filename</dt>
            <dd><c:out value="${movieForm.movieFilename}" />.<c:out value="${movieForm.movieType.name}" /></dd>
            <dt>Picture Filename</dt>
            <dd><c:out value="${movieForm.pictureFilename}" /></dd>
            <dt>Subtitles</dt>
            <dd>
                <c:choose>
                    <c:when test="${empty movieForm.subtitles}">
                        No Subtitles added
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
            <button type="submit" class="btn btn-info pull-left" id="back" name="_eventId_back"><i class="icon-arrow-left icon-white"></i> <strong>Back</strong></button>
            <div class="pull-right">
                <button type="submit" class="btn btn-success" id="savemovie" name="_eventId_savemovie"><i class="icon-ok-circle icon-white"></i> <strong>Save Movie</strong></button>
            </div>
        </div>
    </div>
</form:form>
            
<div>
    <hr />
        
    <p class="muted text-center">Step 5 of 5</p>
        
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
