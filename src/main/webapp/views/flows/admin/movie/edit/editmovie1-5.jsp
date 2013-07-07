<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="flow-container">

    <h3><spring:message code="flow.editmovie.page1_5.pagetitle.label" /></h3>

    <div class="span4">

        <form:form modelAttribute="genreObject" action="${flowExecutionUrl}">
            <div id="edit-movie-genre-title-group" class="control-group">
                <label class="control-label" for="inputTitle"><strong><spring:message code="flow.editmovie.page1_5.form.genretitle.label" /></strong></label>
                <div class="controls">
                    <form:input class="span4" path="title" id="inputGenreTitle" />
                </div>
            </div>

            <div class="control-group">
                <div class="controls pull-right">
                    <button type="submit" class="btn btn-danger btn-small" id="back" name="_eventId_back"><i class="icon-remove-circle icon-white"></i> <strong><spring:message code="overall.flow.button.abort.label" /></strong></button>
                    <button type="submit" class="btn btn-success btn-small" id="creategenre" name="_eventId_create"><i class="icon-ok-circle icon-white"></i> <strong><spring:message code="overall.flow.button.create.label" /></strong></button>
                </div>
            </div>
        </form:form>

    </div>

</div>

<div class="progress-flow">
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
