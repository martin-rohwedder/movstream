<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="icon" href="<c:out value="${pageContext.servletContext.contextPath}" />/resources/img/favicon.png" type="image/x-icon"/>
        <link rel="shortcut icon" href="<c:out value="${pageContext.servletContext.contextPath}" />/resources/img/favicon.ico" type="image/x-icon" />
        <title><tiles:insertAttribute name="title" ignore="true" /></title>
        
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}" />/resources/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}" />/resources/css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}" />/resources/css/login-theme.css" />
        
        <!-- Javascript -->
        <script src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    </head>
    <body>
        <sec:authorize access="isAuthenticated()">
            <c:redirect url="/" />
        </sec:authorize>
        
        <div class="signin-to-center">
            <tiles:insertAttribute name="content" />
        </div>
        
        <script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/utilities.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                if (isDateBetweenRange(new Date(), new Date(new Date().getFullYear(), 11, 01), new Date(new Date().getFullYear(), 11, 31))) {
                    $("head").append($('<link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}" />/resources/css/christmas-style.css" />'));
                    $(".form-signin").prepend($('<div class="pixie-hat"></div>'));
                }
            });
        </script>
    </body>
</html>
