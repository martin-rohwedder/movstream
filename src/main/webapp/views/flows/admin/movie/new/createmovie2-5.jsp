<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="flow-container">

    <h3><spring:message code="flow.newmovie.page2_5.pagetitle.label" /></h3>

    <div class="span5">

        <form:form modelAttribute="seasonObject" action="${flowExecutionUrl}">
            <div id="new-movie-season-title-group" class="control-group">
                <label class="control-label" for="inputSeasonTitle"><strong><spring:message code="flow.newmovie.page2_5.form.seasontitle.label" /></strong></label>
                <div class="controls">
                    <form:input class="span5" path="title" id="inputSeasonTitle" />
                </div>
            </div>

            <div id="new-movie-season-description-group" class="control-group">
                <label class="control-label" for="inputSeasonDescription"><strong><spring:message code="flow.newmovie.page2_5.form.seasondescription.label" /></strong></label>
                <div class="controls">
                    <form:textarea class="span5" path="description" id="inputSeasonDescription" rows="4"></form:textarea>
                    </div>
                </div>

                <div class="control-group">
                    <div class="controls pull-right">
                        <button type="submit" class="btn btn-danger btn-small" id="back" name="_eventId_back"><i class="icon-remove-circle icon-white"></i> <strong><spring:message code="overall.flow.button.abort.label" /></strong></button>
                        <button type="submit" class="btn btn-success btn-small" id="createseason" name="_eventId_create"><i class="icon-ok-circle icon-white"></i> <strong><spring:message code="overall.flow.button.create.label" /></strong></button>
                    </div>
                </div>
        </form:form>

    </div>

</div>

<div>
    <hr />
        
    <p class="muted text-center"><spring:message code="overall.flow.steps.label" arguments="2,5" argumentSeparator="," /></p>
        
    <div class="progress progress-striped active">
        <div class="bar" data-percentage="25"></div>
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

<script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/validation/new-movie-validation.js"></script>
