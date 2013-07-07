<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form:form modelAttribute="movieForm" action="${flowExecutionUrl}">

<div class="flow-container">

    <h3><spring:message code="flow.newmovie.page2.pagetitle.label" /></h3>
    
    <div class="span5">

        <p class="muted"><spring:message code="flow.newmovie.page2.pagedescription.label" /></p>

            <div id="new-movie-season-group" class="control-group">
                <label class="control-label" for="inputSeason"><strong><spring:message code="flow.newmovie.page2.form.season.label" /></strong></label>
                <div class="controls input-prepend">
                    <span class="add-on" title="<spring:message code="flow.newmovie.page2.form.season.helptext" />"><i class="icon-question-sign"></i></span>
                        <form:select id="inputSeason" path="season.title" class="span3">
                            <c:forEach items="${seasons}" var="season">
                                <form:option value="${season.title}" />
                            </c:forEach>
                        </form:select>
                    <button type="submit" class="btn btn-link btn-mini" id="newseason" name="_eventId_newseason">(<spring:message code="flow.newmovie.page2.form.season.newseason.button" />)</button>
                </div>
            </div>

    </div>

</div>

    <div class="control-group">
        <div class="controls">
            <button type="submit" class="btn btn-info pull-left" id="back" name="_eventId_back"><i class="icon-chevron-left icon-white"></i> <strong><spring:message code="overall.flow.button.back.label" /></strong></button>
            <div class="pull-right">
                <button type="submit" class="btn btn-warning" id="skip" name="_eventId_skip"><strong><spring:message code="flow.newmovie.page2.form.button.skip.label" /></strong> <i class="icon-share-alt icon-white"></i></button>
                <button type="submit" class="btn btn-info" id="next" name="_eventId_next"><strong><spring:message code="flow.newmovie.page2.form.button.addtoseason.label" /></strong> <i class="icon-chevron-right icon-white"></i></button>
            </div>
        </div>
    </div>
</form:form>

<div class="clearfix"></div>

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

<script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/validation/new-movie-validation.js" defer></script>
