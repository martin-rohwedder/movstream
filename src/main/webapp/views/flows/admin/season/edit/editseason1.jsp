<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form:form modelAttribute="seasonForm" action="${flowExecutionUrl}">

<div class="flow-container">

    <h3><spring:message code="flow.editseason.page1.pagetitle.label" /></h3>

    <div class="span5">

        <p class="muted"><spring:message code="flow.editseason.page1.pagedescription.label" /></p>
        
        <div id="edit-season-title-group" class="control-group">
            <label class="control-label" for="inputTitle"><strong><spring:message code="flow.editseason.page1.form.seasontitle.label" /></strong></label>
            <div class="controls">
                <form:input class="span5" path="title" id="inputTitle" />
            </div>
        </div>

        <div id="edit-season-description-group" class="control-group">
            <label class="control-label" for="inputDescription"><strong><spring:message code="flow.editseason.page1.form.seasondescription.label" /></strong></label>
            <div class="controls">
                <form:textarea class="span5" path="description" id="inputDescription" rows="4"></form:textarea>
            </div>
        </div>
                    
    </div>

</div>

    <div class="control-group">
        <div class="controls">
            <button type="submit" class="btn btn-danger pull-left" id="end" name="_eventId_end"><i class="icon-remove-circle icon-white"></i> <strong><spring:message code="overall.flow.button.cancel.label" /></strong></button>
            <button type="submit" class="btn btn-success pull-right" id="saveseason" name="_eventId_saveseason"><i class="icon-ok-circle icon-white"></i> <strong><spring:message code="flow.editseason.page1.form.button.saveseason.label" /></strong></button>
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

<script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/validation/edit-season-validation.js" defer></script>
