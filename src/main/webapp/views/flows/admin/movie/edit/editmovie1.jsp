<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form:form modelAttribute="movieForm" action="${flowExecutionUrl}">

<div class="flow-container">

    <h3><spring:message code="flow.editmovie.page1.pagetitle.label" /></h3>

    <div class="span5">

        <p class="muted"><spring:message code="flow.editmovie.page1.pagedescription.label" /></p>

            <div id="edit-movie-title-group" class="control-group">
                <label class="control-label" for="inputTitle"><strong><spring:message code="flow.editmovie.page1.form.title.label" /></strong></label>
                <div class="controls">
                    <form:input class="span5" path="title" id="inputTitle" />
                </div>
            </div>

            <div id="edit-movie-genre-group" class="control-group">
                <label class="control-label" for="inputGenre"><strong><spring:message code="flow.editmovie.page1.form.genre.label" /></strong></label>
                <div class="controls input-prepend">
                    <span class="add-on" title="<spring:message code="flow.editmovie.page1.form.genre.helptext" />"><i class="icon-question-sign"></i></span>
                        <form:select id="inputGenre" path="genre.title" class="span3">
                            <c:forEach items="${genres}" var="genre">
                                <form:option value="${genre.title}" />
                            </c:forEach>
                        </form:select>
                    <button type="submit" class="btn btn-link btn-mini" id="newgenre" name="_eventId_newgenre">(<spring:message code="flow.editmovie.page1.form.genre.newgenre.button" />)</button>
                </div>
            </div>

                    <div id="edit-movie-description-group" class="control-group">
                        <label class="control-label" for="inputDescription"><strong><spring:message code="flow.editmovie.page1.form.description.label" /></strong></label>
                        <div class="controls">
                            <form:textarea class="span5" path="description" id="inputDescription" placeholder="Movie Description" rows="4"></form:textarea>
                        </div>
                    </div>

    </div>

</div>

    <div class="control-group">
        <div class="controls">
            <button type="submit" class="btn btn-danger pull-left" id="end" name="_eventId_end"><i class="icon-remove-circle icon-white"></i> <strong><spring:message code="overall.flow.button.cancel.label" /></strong></button>
            <button type="submit" class="btn btn-info pull-right" id="next1" name="_eventId_next"><strong><spring:message code="overall.flow.button.next.label" /></strong> <i class="icon-chevron-right icon-white"></i></button>
        </div>
    </div>
</form:form>

<div class="clearfix"></div>

<div>
    <hr />
        
    <p class="muted text-center"><spring:message code="overall.flow.steps.label" arguments="1,5" argumentSeparator="," /></p>
        
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
