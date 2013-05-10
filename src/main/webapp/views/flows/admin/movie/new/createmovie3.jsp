<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>New Movie</h3>

<div class="span5">
    
    <form:form modelAttribute="movieForm" action="${flowExecutionUrl}">
        <div class="control-group">
            <label class="control-label" for="inputMovieFilename"><strong>Movie Filename</strong></label>
            <div class="controls input-prepend">
                <span class="add-on" title="include the name of the movie file. Don't include the file path, since this should be set by a superadmin, in the system options"><i class="icon-question-sign"></i></span>
                <form:input class="span5" path="movieFilename" id="inputMovieFilename" placeholder="Movie Filename (Don't include path)" />
            </div>
        </div>
            
        <div class="control-group">
            <label class="control-label" for="inputPictureFilename"><strong>Movie Picture Filename</strong></label>
            <div class="controls input-prepend">
                <span class="add-on" title="include the name of the movie picture file. Don't include the file path, since this should be set by a superadmin, in the system options"><i class="icon-question-sign"></i></span>
                <form:input class="span5" path="pictureFilename" id="inputPictureFilename" placeholder="picture Filename (Don't include path)" />
            </div>
        </div>
            
        <div class="control-group">
            <div class="controls pull-right">
                <button type="submit" class="btn btn-danger btn-small" id="back" name="_eventId_back"><i class="icon-arrow-left icon-white"></i> <strong>Back</strong></button>
                <button type="submit" class="btn btn-success btn-small" id="next" name="_eventId_next"><strong>Next</strong> <i class="icon-chevron-right icon-white"></i></button>
            </div>
        </div>
    </form:form>

</div>
    
<div class="progress-flow">
    <hr />
        
    <p class="muted text-center">Step 3 of 4</p>
        
    <div class="progress progress-striped active">
        <div class="bar" data-percentage="75"></div>
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
