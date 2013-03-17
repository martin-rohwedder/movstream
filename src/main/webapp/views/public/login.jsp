<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="<c:out value="${pageContext.servletContext.contextPath}" />/logincheck.do" method="post" class="form-signin">
    <h2>Please Login</h2>
    
    <c:choose>
        <c:when test="${not empty loginError}">
            <div class="control-group error">
                <div class="controls">
                    <input type="text" name="username" />
                    <span class="help-inline">Username may be wrong</span>
                </div>
            </div>
            
            <div class="control-group error">
                <div class="controls">
                    <input type="password" name="password" />
                    <span class="help-inline">Password may be wrong</span>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="control-group">
                <div class="controls">
                    <input type="text" name="username" placeholder="Username" />
                </div>
            </div>
            
            <div class="control-group">
                <div class="controls">
                    <input type="password" name="password" placeholder="Password" />
                </div>
            </div>
        </c:otherwise>
    </c:choose>
    
    <button class="btn btn-large btn-primary" type="submit"><i class="icon-lock icon-white"></i> Sign In</button>
</form>