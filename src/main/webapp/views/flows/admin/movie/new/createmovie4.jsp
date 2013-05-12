<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="flow-container">

    <h3>New Movie</h3>

    <div class="span5">

        <p class="muted">Add as many subtitles as you like for the movie.</p>

        <form:form modelAttribute="movieForm" action="${flowExecutionUrl}">

            <table class="table table-bordered table-striped table-condensed subtitle-table span5">
                <thead>
                    <tr>
                        <th>Filename</th>
                        <th>Language</th>
                        <th>Language Source</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="index" value="0" />
                    <c:forEach items="${movieForm.subtitles}" var="subtitle">
                        <tr>
                            <td><c:out value="${subtitle.filename}" /></td>
                            <td><c:out value="${subtitle.language}" /></td>
                            <td><c:out value="${subtitle.srcLang}" /></td>
                            <td><a class="btn btn-danger btn-mini" href="${flowExecutionUrl}&_eventId=removesub&subindex=<c:out value="${index}" />"><i class="icon-remove-circle icon-white"></i> Remove</a></td>
                        </tr>
                        <c:set var="index" value="${index + 1}" />
                    </c:forEach>
                </tbody>
            </table>
        </form:form>

    </div>

</div>

<form:form modelAttribute="movieForm" class="clearfix">
    <div class="control-group">
        <div class="controls">
            <button type="submit" class="btn btn-info pull-left" id="back" name="_eventId_back"><i class="icon-chevron-left icon-white"></i> <strong>Back</strong></button>
            <div class="pull-right">
                <button type="submit" class="btn btn-warning" id="addsub" name="_eventId_addsub"><i class="icon-plus icon-white"></i> <strong>Add Subtitle</strong></button>
                <button type="submit" class="btn btn-info" id="next" name="_eventId_next"><strong>Next</strong> <i class="icon-chevron-right icon-white"></i></button>
            </div>
        </div>
    </div>
</form:form>

<div>
    <hr />
        
    <p class="muted text-center">Step 4 of 5</p>
        
    <div class="progress progress-striped active">
        <div class="bar" data-percentage="75"></div>
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

