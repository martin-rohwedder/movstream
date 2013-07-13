<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h1><spring:message code="page.adminmanagesettings.pagetitle.label" /></h1>

<br />

<form method="post">
    <div class="control-group">
        <label class="control-label" for="applicationtitle">Page Title</label>
        <div class="controls">
            <input type="text" class="input-large" id="applicationtitle" name="applicationtitle" value="<c:out value="${applicationtitle}" />" maxlength="20" />
        </div>
    </div>
    
    <div class="control-group">
        <label class="control-label" for="systemLanguage">System Language</label>
        <div class="controls">
            <select class="input-large" id="systemLanguage" name="languageCode">
                <c:forEach items="${languages}" var="language">
                    <c:choose>
                        <c:when test="${language.code eq currentLanguageCode}">
                            <option value="${language.code}" selected="true"><c:out value="${language.name}" /></option>
                        </c:when>
                        <c:otherwise>
                            <option value="${language.code}"><c:out value="${language.name}" /></option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
        </div>
    </div>
    
    <div class="control-group">
        <label class="control-label" for="localLocation">Local Movie Location<a href="#" class="btn btn-link btn-mini">(How To Change Local Context)</a></label>
        <div class="controls">
            <span class="input-xlarge uneditable-input"><c:out value="${localDirectory}" /></span>
        </div>
    </div>
    
    <div class="control-group">
        <label class="control-label" for="externalLocations">External Movie Locations</label>
        <div class="controls input-prepend">
            <span class="add-on" title="You can define more than one external movie locations, by adding the web address to the location, and seperate each locaton by a comma. If you don't use any external locations, you can also upload movies to your local context, {LOCAL_LOCATION}. To get information about, how to change your local context, please click the link 'hwo to change local context' besides the local location field"><i class="icon-question-sign"></i></span>
            <input class="input-xxlarge" type="text" id="externalLocations" name="externalLocations" placeholder="http://www.mymovies.com/movies/, http://..." value="<c:out value="${externalLocations}" />" />
        </div>
    </div>
    
    <div class="control-group">
        <div class="controls">
            <button class="btn btn-success" type="submit"><i class="icon-white icon-ok-circle"></i> Save Settings</button>
        </div>
    </div>
</form>
