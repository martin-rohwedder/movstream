<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<form action="<c:out value="${pageContext.servletContext.contextPath}" />/logincheck.do" method="post" class="form-signin">
    <h2><spring:message code="page.login.title" /></h2>
    
    <c:choose>
        <c:when test="${not empty loginError}">
            <div class="control-group error">
                <div class="controls">
                    <input type="text" name="username" />
                    <span class="help-inline"><spring:message code="page.login.form.error.helpline.username" /></span>
                </div>
            </div>
            
            <div class="control-group error">
                <div class="controls">
                    <input type="password" name="password" />
                    <span class="help-inline"><spring:message code="page.login.form.error.helpline.password" /></span>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="control-group">
                <div class="controls">
                    <input type="text" name="username" placeholder="<spring:message code="page.login.form.placeholder.username" />" />
                </div>
            </div>
            
            <div class="control-group">
                <div class="controls">
                    <input type="password" name="password" placeholder="<spring:message code="page.login.form.placeholder.password" />" />
                </div>
            </div>
        </c:otherwise>
    </c:choose>
    
    <div class="control-group">
        <div class="controls">
            <label class="checkbox">
                <input type="checkbox" name="_spring_security_remember_me" />
                <spring:message code="page.login.form.label.rememberme" />
            </label>
        </div>
    </div>
    
    <button class="btn btn-large btn-primary" type="submit"><i class="icon-lock icon-white"></i> <spring:message code="page.login.form.submit.label" /></button>
</form>