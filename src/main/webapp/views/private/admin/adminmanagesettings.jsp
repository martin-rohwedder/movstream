<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:if test="${not empty param.settingsSaved}">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong><spring:message code="overall.congratulations.label" />!</strong> <spring:message code="page.adminmanagesettings.dialog.success.settingssaved.message" />.</p>
    </div>
</c:if>

<h1><spring:message code="page.adminmanagesettings.pagetitle.label" /></h1>

<br />

<form method="post">
    <div class="control-group">
        <label class="control-label" for="applicationtitle"><spring:message code="page.adminmanagesettings.form.applicationtitle.label" /></label>
        <div class="controls">
            <input type="text" class="input-large" id="applicationtitle" name="applicationtitle" value="<c:out value="${applicationtitle}" />" maxlength="20" />
        </div>
    </div>
    
    <div class="control-group">
        <label class="control-label" for="systemLanguage"><spring:message code="page.adminmanagesettings.form.systemlanguage.label" /></label>
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
        <label class="control-label" for="localLocation"><spring:message code="page.adminmanagesettings.form.localdirectory.label" /><button class="btn btn-link btn-mini local-directory-helptext">(<spring:message code="page.adminmanagesettings.form.btn.howtochangelocaldirectory.label" />)</button></label>
        <div class="controls">
            <span class="input-xlarge uneditable-input"><c:out value="${localDirectory}" /></span>
        </div>
    </div>
    
    <div class="control-group">
        <label class="control-label" for="externalLocations"><spring:message code="page.adminmanagesettings.form.externalLocations.label" /></label>
        <div class="controls input-prepend">
            <span class="add-on" title="<spring:message code="page.adminmanagesettings.form.externalLocations.helptext" />"><i class="icon-question-sign"></i></span>
            <input class="input-xxlarge" type="text" id="externalLocations" name="externalLocations" placeholder="http://www.mymovies.com, http://w..." value="<c:out value="${externalLocations}" />" />
        </div>
    </div>
    
    <div class="control-group">
        <div class="controls">
            <sec:authorize access="hasRole('ROLE_TEST')">
                <button disabled="disabled" class="btn btn-success" type="submit"><i class="icon-white icon-ok-circle"></i> <spring:message code="page.adminmanagesettings.form.button.savesettings.label" /></button>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_SUPERADMIN')">
                <button class="btn btn-success" type="submit"><i class="icon-white icon-ok-circle"></i> <spring:message code="page.adminmanagesettings.form.button.savesettings.label" /></button>
            </sec:authorize>
        </div>
    </div>
</form>

<div id="modal-local-directory-helptext-container" class="modal hide fade">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3><spring:message code="page.adminmanagesettings.dialog.localdirectoryhelptext.headline" /></h3>
    </div>
    <div class="modal-body">
        <p><spring:message code="page.adminmanagesettings.dialog.localdirectoryhelptext.infomessage.label" />.</p>
    </div>
    <div class="modal-footer">
        <a href="" class="btn" data-dismiss="modal" aria-hidden="true"><spring:message code="overall.ok.label" /></a>
    </div>
</div>
    
<script type="text/javascript">
    $(document).ready(function() {
        $('#modal-local-directory-helptext-container').bind('show', function() {}).modal({ backdrop: true, show: false });

        $('.local-directory-helptext').click(function(e) {
            e.preventDefault();
            $('#modal-local-directory-helptext-container').modal('show');
        });
    });
</script>
