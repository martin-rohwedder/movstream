<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>New Movie</h3>

<div class="span4">
    
    <form:form modelAttribute="movieForm" action="${flowExecutionUrl}">
        <div class="control-group">
            <label class="control-label" for="inputSeason"><strong>Choose Season</strong></label>
            <div class="controls input-prepend">
                <span class="add-on" title="A season defines a collection of moviesm which all is associated with the same story. A season is not when movies is in the same category, but only if they are part of the same story"><i class="icon-question-sign"></i></span>
                <form:select path="season.title">
                    <c:forEach items="${seasons}" var="season">
                        <form:option value="${season.title}" />
                    </c:forEach>
                </form:select>
                <button type="submit" class="btn btn-link btn-mini" id="newseason" name="_eventId_newseason">(Create New Season)</button>
            </div>
        </div>
            
        <div class="control-group">
            <div class="controls pull-right">
                <button type="submit" class="btn btn-danger btn-small" id="back" name="_eventId_back"><i class="icon-arrow-left icon-white"></i> <strong>Back</strong></button>
                <button type="submit" class="btn btn-warning btn-small" id="skip" name="_eventId_skip"><strong>Skip</strong> <i class="icon-share-alt icon-white"></i></button>
                <button type="submit" class="btn btn-success btn-small" id="next" name="_eventId_next"><strong>Add To Season</strong> <i class="icon-chevron-right icon-white"></i></button>
            </div>
        </div>
    </form:form>

</div>
    
<div class="progress-flow">
    <hr />
        
    <p class="muted text-center">Step 2 of 4</p>
        
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