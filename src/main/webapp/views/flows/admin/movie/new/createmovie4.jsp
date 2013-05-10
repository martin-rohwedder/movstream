<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>New Movie</h3>

<table class="table">
    <thead>
        <tr>
            <th>Filename</th>
            <th>Language</th>
            <th>Language Source</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Test.vtt</td>
            <td>Danish</td>
            <td>da</td>
        </tr>
    </tbody>
</table>

<div class="span5">
    
    <form:form modelAttribute="movieForm" action="${flowExecutionUrl}">
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
        
    <p class="muted text-center">Step 4 of 4</p>
        
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

