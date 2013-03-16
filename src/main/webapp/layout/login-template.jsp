<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title><tiles:insertAttribute name="title" ignore="true" /></title>
        
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}" />/resources/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}" />/resources/css/bootstrap-responsive.min.css" />
        
        <!-- Javascript -->
        <script src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    </head>
    <body>
        <tiles:insertAttribute name="content" />
    </body>
</html>
