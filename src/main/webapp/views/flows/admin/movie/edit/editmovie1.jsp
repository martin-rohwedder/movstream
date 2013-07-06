<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form:form modelAttribute="movieForm" action="${flowExecutionUrl}">

<div class="flow-container">

    <h3>New Movie</h3>

    <div class="span5">

        <p class="muted">Define movie details</p>

            <div id="edit-movie-title-group" class="control-group">
                <label class="control-label" for="inputTitle"><strong>Title</strong></label>
                <div class="controls">
                    <form:input class="span5" path="title" id="inputTitle" placeholder="Movie Title" />
                </div>
            </div>

            <div id="edit-movie-genre-group" class="control-group">
                <label class="control-label" for="inputGenre"><strong>Genre</strong></label>
                <div class="controls input-prepend">
                    <span class="add-on" title="A genre defines a category the movie fits under. If you don't reckognise a suitable genre in the list, then click 'Create New Genre' to create new one."><i class="icon-question-sign"></i></span>
                        <form:select id="inputGenre" path="genre.title" class="span3">
                            <c:forEach items="${genres}" var="genre">
                                <form:option value="${genre.title}" />
                            </c:forEach>
                        </form:select>
                    <button type="submit" class="btn btn-link btn-mini" id="newgenre" name="_eventId_newgenre">(Create New Genre)</button>
                </div>
            </div>

                    <div id="edit-movie-description-group" class="control-group">
                        <label class="control-label" for="inputDescription"><strong>Description</strong></label>
                        <div class="controls">
                            <form:textarea class="span5" path="description" id="inputDescription" placeholder="Movie Description" rows="4"></form:textarea>
                        </div>
                    </div>

    </div>

</div>

    <div class="control-group">
        <div class="controls">
            <button type="submit" class="btn btn-danger pull-left" id="end" name="_eventId_end"><i class="icon-remove-circle icon-white"></i> <strong>Cancel</strong></button>
            <button type="submit" class="btn btn-info pull-right" id="next1" name="_eventId_next"><strong>Next</strong> <i class="icon-chevron-right icon-white"></i></button>
        </div>
    </div>
</form:form>

<div class="clearfix"></div>

<div>
    <hr />
        
    <p class="muted text-center">Step 1 of 5</p>
        
    <div class="progress progress-striped active">
        <div class="bar" data-percentage="0"></div>
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

<script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/validation/edit-movie-validation.js" defer></script>
