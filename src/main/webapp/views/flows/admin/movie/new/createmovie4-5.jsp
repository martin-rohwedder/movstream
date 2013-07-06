<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="flow-container">

    <h3>New Movie</h3>

    <div class="span5">

        <form:form modelAttribute="subtitleObject" action="${flowExecutionUrl}">
            <div id="new-movie-subtitle-filename-group" class="control-group">
                <label class="control-label" for="inputSubtitleFilename"><strong>Subtitle Filename</strong></label>
                <div class="controls input-append">
                    <form:input class="span5" path="filename" id="inputSubtitleFilename" placeholder="Subtitle Filename (Don't include path)" />
                    <span class="add-on">.vtt</span>
                </div>
            </div>
                    
            <div id="new-movie-subtitle-language-group" class="control-group">
                <label class="control-label" for="inputLanguage"><strong>Language</strong></label>
                <div class="controls">
                    <form:input class="span5" path="language" id="inputLanguage" placeholder="e.g. English" />
                </div>
            </div>
                    
            <div id="new-movie-subtitle-langsrc-group" class="control-group">
                <label class="control-label" for="inputSrcLang"><strong>Language Source</strong></label>
                <div class="controls">
                    <form:input class="span5" path="srcLang" id="inputSrcLang" placeholder="e.g. 'en'" />
                </div>
            </div>
            
            <div class="control-group">
                    <div class="controls pull-right">
                        <button type="submit" class="btn btn-danger btn-small" id="back" name="_eventId_back"><i class="icon-remove-circle icon-white"></i> <strong>Don't Add Subtitle</strong></button>
                        <button type="submit" class="btn btn-success btn-small" id="createsubtitle" name="_eventId_create"><i class="icon-ok-circle icon-white"></i> <strong>Add Subtitle</strong></button>
                    </div>
                </div>
        </form:form>

    </div>

</div>

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

<script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/validation/new-movie-validation.js" defer></script>
