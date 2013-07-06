<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form:form modelAttribute="movieForm" action="${flowExecutionUrl}">

<div class="flow-container">

    <h3>New Movie</h3>

    <div class="span5">

        <p class="muted">Define the movie filename and movie picture filename.</p>

            <div id="new-movie-filename-group" class="control-group">
                <label class="control-label" for="inputMovieFilename"><strong>Movie Filename</strong></label>
                <div class="controls controls-row">
                    <form:input class="span4" path="movieFilename" id="inputMovieFilename" placeholder="Movie Filename (Don't include path)" />
                    <form:select path="movieType.name" class="span1">
                        <c:forEach items="${movieTypes}" var="type">
                            <form:option value="${type.name}" />
                        </c:forEach>
                    </form:select>
                </div>
            </div>

            <div id="new-movie-picture-filename-group" class="control-group">
                <label class="control-label" for="inputPictureFilename"><strong>Movie Picture Filename</strong></label>
                <div class="controls">
                    <form:input class="span5" path="pictureFilename" id="inputPictureFilename" placeholder="picture Filename (Don't include path)" />
                </div>
            </div>

    </div>

</div>
                
    <div class="control-group">
        <div class="controls">
            <button type="submit" class="btn btn-info pull-left" id="back" name="_eventId_back"><i class="icon-chevron-left icon-white"></i> <strong>Back</strong></button>
            <button type="submit" class="btn btn-info pull-right" id="next3" name="_eventId_next"><strong>Next</strong> <i class="icon-chevron-right icon-white"></i></button>
        </div>
    </div>
</form:form>

<div class="clearfix"></div>

<div>
    <hr />
        
    <p class="muted text-center">Step 3 of 5</p>
        
    <div class="progress progress-striped active">
        <div class="bar" data-percentage="50"></div>
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

<script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/validation/new-movie-validation.js" defer></script>
