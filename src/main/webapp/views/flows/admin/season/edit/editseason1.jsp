<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form:form modelAttribute="seasonForm" action="${flowExecutionUrl}">

<div class="flow-container">

    <h3>Edit Season</h3>

    <div class="span5">

        <p class="muted">Edit the seasons title and description</p>
        
        <div class="control-group">
            <label class="control-label" for="inputTitle"><strong>Season Title</strong></label>
            <div class="controls">
                <form:input class="span5" path="title" id="inputTitle" placeholder="Season Title" />
            </div>
        </div>

        <div class="control-group">
            <label class="control-label" for="inputDescription"><strong>Description</strong></label>
            <div class="controls">
                <form:textarea class="span5" path="description" id="inputDescription" placeholder="Season Description" rows="4"></form:textarea>
            </div>
        </div>
                    
    </div>

</div>

    <div class="control-group">
        <div class="controls">
            <button type="submit" class="btn btn-danger pull-left" id="end" name="_eventId_end"><i class="icon-remove-circle icon-white"></i> <strong>Cancel</strong></button>
            <button type="submit" class="btn btn-success pull-right" id="saveseason" name="_eventId_saveseason"><i class="icon-ok-circle icon-white"></i> <strong>Save Season</strong></button>
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
