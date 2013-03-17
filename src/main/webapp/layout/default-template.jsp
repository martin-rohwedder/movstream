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
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}" />/resources/css/default-theme.css" />
        
        <!-- Javascript -->
        <script src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body>
        <tiles:useAttribute id="currentPage" name="page" classname="java.lang.String" />
        
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    
                    <a href="<c:out value="${pageContext.servletContext.contextPath}" />/" class="brand">Movstream</a>
                    <div class="nav-collapse collapse">
                        <p class="navbar-text pull-right">Logged in as <a href="<c:out value="${pageContext.servletContext.contextPath}" />/" class="navbar-link">Username</a></p>
                        
                        <ul class="nav">  
                            <c:choose>
                                <c:when test="${currentPage eq 'home'}">
                                    <li class="active"><a href="<c:out value="${pageContext.servletContext.contextPath}" />/home"><i class="icon-home icon-white"></i> Home</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="<c:out value="${pageContext.servletContext.contextPath}" />/home"><i class="icon-home icon-white"></i> Home</a></li>
                                </c:otherwise>
                            </c:choose> 
                                    
                                    <li><a href="<c:out value="${pageContext.servletContext.contextPath}" />/logout"><i class="icon-off icon-white"></i> Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container container-content">
            <tiles:insertAttribute name="content" />
        </div>
        
        <div class="container">
            <div id="footer" class="row">
                <div class="span4">
                    <p>&copy; 2013 <span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Movstream</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/martin-rohwedder/movstream" property="cc:attributionName" rel="cc:attributionURL">Martin Rohwedder</a></p>
                </div>
                <div id="cc-license" class="span8">
                    <p>
                        <a rel="license" href="http://creativecommons.org/licenses/by-nc/3.0/deed">
                            <img alt="Creative Commons licens" style="border-width:0" src="http://i.creativecommons.org/l/by-nc/3.0/80x15.png" />
                        </a>
                        Creative Commons 3.0 License
                    </p>
                </div>
            </div>
        </div>
    </body>
</html>