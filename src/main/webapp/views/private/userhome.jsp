<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<h1 class="page-header"><spring:message code="page.userhome.pagetitle.label" /></h1>

<c:if test="${param.passwordChanged == 3}">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong><spring:message code="overall.congratulations.label" />!</strong> <spring:message code="page.userhome.dialog.success.message" />.</p>
    </div>
</c:if>

<p class="page-paragraph"><spring:message code="page.userhome.pagedescription.label" arguments="${user.username}" />.</p>

<form class="form-horizontal" method="post">
    <c:choose>
        <c:when test="${param.passwordChanged == 0}">
    <div class="control-group error">
        <label class="control-label" for="inputOldPassword"><spring:message code="page.userhome.form.currentpassword.label" /></label>
        <div class="controls">
            <input class="span4" type="password" name="oldPassword" id="inputOldPassword" placeholder="<spring:message code="page.userhome.form.currentpassword.label" />">
            <span class="help-inline"><spring:message code="page.userhome.form.error.currentpassword.message" /></span>
        </div>
    </div>
        </c:when>
        <c:otherwise>
    <div class="control-group">
        <label class="control-label" for="inputOldPassword"><spring:message code="page.userhome.form.currentpassword.label" /></label>
        <div class="controls">
            <input class="span4" type="password" name="oldPassword" id="inputOldPassword" placeholder="<spring:message code="page.userhome.form.currentpassword.label" />">
        </div>
    </div>
        </c:otherwise>
    </c:choose>
    
    <c:choose>
        <c:when test="${param.passwordChanged == 1}">
    <div class="control-group error">
        <label class="control-label" for="inputNewPassword"><spring:message code="overall.newpassword.label" /></label>
        <div class="controls">
            <input class="span4" type="password" name="newPassword" id="inputNewPassword" placeholder="<spring:message code="overall.newpassword.label" />">
            <span class="help-inline"><spring:message code="overall.error.message.password.minchars" /></span>
        </div>
    </div>
    
    <div class="control-group error">
        <label class="control-label" for="inputRepeatNewPassword"><spring:message code="overall.repeatnewpassword.label" /></label>
        <div class="controls">
            <input class="span4" type="password" name="repeatNewPassword" id="inputRepeatNewPassword" placeholder="<spring:message code="overall.repeatnewpassword.label" />">
            <span class="help-inline"><spring:message code="overall.error.message.password.minchars" /></span>
        </div>
    </div>
        </c:when>
        <c:when test="${param.passwordChanged == 2}">
    <div class="control-group error">
        <label class="control-label" for="inputNewPassword"><spring:message code="overall.newpassword.label" /></label>
        <div class="controls">
            <input class="span4" type="password" name="newPassword" id="inputNewPassword" placeholder="<spring:message code="overall.newpassword.label" />">
        </div>
    </div>
    
    <div class="control-group error">
        <label class="control-label" for="inputRepeatNewPassword"><spring:message code="overall.repeatnewpassword.label" /></label>
        <div class="controls">
            <input class="span4" type="password" name="repeatNewPassword" id="inputRepeatNewPassword" placeholder="<spring:message code="overall.repeatnewpassword.label" />">
            <span class="help-inline"><spring:message code="overall.error.message.password.mismatch" /></span>
        </div>
    </div>
        </c:when>
        <c:otherwise>
    <div class="control-group">
        <label class="control-label" for="inputNewPassword"><spring:message code="overall.newpassword.label" /></label>
        <div class="controls">
            <input class="span4" type="password" name="newPassword" id="inputNewPassword" placeholder="<spring:message code="overall.newpassword.label" />">
        </div>
    </div>
    
    <div class="control-group">
        <label class="control-label" for="inputRepeatNewPassword"><spring:message code="overall.repeatnewpassword.label" /></label>
        <div class="controls">
            <input class="span4" type="password" name="repeatNewPassword" id="inputRepeatNewPassword" placeholder="<spring:message code="overall.repeatnewpassword.label" />">
        </div>
    </div>
        </c:otherwise>
    </c:choose>

    <div class="control-group">
        <div class="controls">
            <sec:authorize access="hasRole('ROLE_TEST')">
            <button type="submit" disabled="disabled" class="btn btn-info btn-large"><spring:message code="page.userhome.form.button.changepassword.label" /></button>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_SUPERADMIN') or hasRole('ROLE_ADMIN')">
            <button type="submit" class="btn btn-info btn-large"><spring:message code="page.userhome.form.button.changepassword.label" /></button>
            </sec:authorize>
        </div>
    </div>
</form>
