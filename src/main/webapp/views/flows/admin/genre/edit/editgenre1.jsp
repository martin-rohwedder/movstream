<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<form:form modelAttribute="genreForm" action="${flowExecutionUrl}">

<div class="flow-container">

    <h3><spring:message code="flow.editgenre.page1.pagetitle.label" /></h3>

    <div class="span5">

        <p class="muted"><spring:message code="flow.editgenre.page1.pagedescription.label" /></p>
        
        <div id="edit-genre-title-group" class="control-group">
            <label class="control-label" for="inputTitle"><strong><spring:message code="flow.editgenre.page1.form.genretitle.label" /></strong></label>
            <div class="controls input-prepend">
                <span class="add-on" title="<spring:message code="flow.editgenre.page1.form.genretitle.helptext" />"><i class="icon-question-sign"></i></span>
                <form:input class="span4" path="title" id="inputTitle" />
            </div>
        </div>
                    
    </div>

</div>

    <div class="control-group">
        <div class="controls">
            <button type="submit" class="btn btn-danger pull-left" id="end" name="_eventId_end"><i class="icon-remove-circle icon-white"></i> <strong><spring:message code="overall.flow.button.cancel.label" /></strong></button>
            <sec:authorize access="hasRole('ROLE_TEST')">
            <button type="submit" disabled="disabled" class="btn btn-success pull-right" id="savegenre" name="_eventId_savegenre"><i class="icon-ok-circle icon-white"></i> <strong><spring:message code="flow.editgenre.page1.form.button.savegenre.label" /></strong></button>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_SUPERADMIN') or hasRole('ROLE_ADMIN')">
            <button type="submit" class="btn btn-success pull-right" id="savegenre" name="_eventId_savegenre"><i class="icon-ok-circle icon-white"></i> <strong><spring:message code="flow.editgenre.page1.form.button.savegenre.label" /></strong></button>
            </sec:authorize>
        </div>
    </div>
</form:form>

<div class="clearfix"></div>

<div>
    <hr />
        
    <p class="muted text-center"><spring:message code="overall.flow.steps.label" arguments="1,1" argumentSeparator="," /></p>
        
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

<script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/validation/edit-genre-validation.js" defer></script>
