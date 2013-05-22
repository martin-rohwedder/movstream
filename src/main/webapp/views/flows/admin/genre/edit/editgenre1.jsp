<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form:form modelAttribute="genreForm" action="${flowExecutionUrl}">

<div class="flow-container">

    <h3>Edit Genre</h3>

    <div class="span5">

        <p class="muted">Rename the movie genre</p>
        
        <div class="control-group">
            <label class="control-label" for="inputTitle"><strong>Genre Title</strong></label>
            <div class="controls input-prepend">
                <span class="add-on" title="The movie genre is like a category for movies associated to it, so choose a descriptive and general title"><i class="icon-question-sign"></i></span>
                <form:input class="span4" path="title" id="inputTitle" placeholder="Genre Title" />
            </div>
        </div>
                    
    </div>

</div>

    <div class="control-group">
        <div class="controls">
            <button type="submit" class="btn btn-danger pull-left" id="end" name="_eventId_end"><i class="icon-remove-circle icon-white"></i> <strong>Cancel</strong></button>
            <button type="submit" class="btn btn-success pull-right" id="savegenre" name="_eventId_savegenre"><i class="icon-ok-circle icon-white"></i> <strong>Save Genre</strong></button>
        </div>
    </div>
</form:form>

<div class="clearfix"></div>

<div>
    <hr />
        
    <p class="muted text-center">Step 1 of 1</p>
        
    <div class="progress progress-striped active">
        <div class="bar" data-percentage="100"></div>
    </div>
    
    <br />
</div>

<script type="text/javascript">
$(document).ready(function() {
    $('.progress .bar').progressbar({
        transition_delay: 400,
        display_text: 0
    });
});
</script>
