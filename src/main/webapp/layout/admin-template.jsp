<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}" />/resources/css/default-theme.css" />
        
        <!-- Javascript -->
        <script src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/bootstrap-progressbar.min.js" type="text/javascript"></script>
        <script src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/highcharts.js" type="text/javascript"></script>
        
        <!-- Fallback on video player to use flash if needed -->
        <script>
            _V_.options.flash.swf = "<c:out value="${pageContext.servletContext.contextPath}" />/resources/flash/video-js.swf";
        </script>
    </head>
    <body>
        <tiles:useAttribute id="currentPage" name="page" classname="java.lang.String" />
        <tiles:useAttribute id="adminPage" name="adminpage" classname="java.lang.String" />
        
        <div class="navbar navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    
                    <a href="<c:out value="${pageContext.servletContext.contextPath}" />/" class="brand"><c:out value="${applicationTitle}" /></a>
                    <div class="nav-collapse collapse">
                        <p class="navbar-text pull-right"><spring:message code="template.navigation.loggedinas.label" /> <a href="<c:out value="${pageContext.servletContext.contextPath}" />/user" class="navbar-link">${user.username}</a></p>
                        
                        <ul class="nav">  
                            <c:choose>
                                <c:when test="${currentPage eq 'home'}">
                                    <li class="active"><a href="<c:out value="${pageContext.servletContext.contextPath}" />/home"><i class="icon-home"></i> <spring:message code="template.navigation.menuitem.home.label" /></a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="<c:out value="${pageContext.servletContext.contextPath}" />/home"><i class="icon-home"></i> <spring:message code="template.navigation.menuitem.home.label" /></a></li>
                                </c:otherwise>
                            </c:choose>
                            
                            <li class="divider-vertical"></li>
                                    
                            <c:choose>
                                <c:when test="${currentPage eq 'genre'}">
                                    <li class="active dropdown">
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-film"></i> <spring:message code="template.navigation.menuitem.browsegenres.label" /> <b class="caret"></b></a>
                                </c:when>
                                <c:otherwise>
                                    <li class="dropdown">
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-film"></i> <spring:message code="template.navigation.menuitem.browsegenres.label" /> <b class="caret"></b></a>
                                </c:otherwise>
                            </c:choose>
                                        <ul class="dropdown-menu">
                                            <c:forEach items="${navGenres}" var="genre">
                                                <li><a href="<c:out value="${pageContext.servletContext.contextPath}" />/genre/<c:out value="${genre.id}" />"><c:out value="${genre.title}" /></a></li>
                                            </c:forEach>
                                        </ul>
                                    </li>
                            
                            <li class="divider-vertical"></li>
                                    
                            <c:choose>
                                <c:when test="${currentPage eq 'user'}">
                                    <li class="active"><a href="<c:out value="${pageContext.servletContext.contextPath}" />/user"><i class="icon-user"></i> <spring:message code="template.navigation.menuitem.myuser.label" /></a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="<c:out value="${pageContext.servletContext.contextPath}" />/user"><i class="icon-user"></i> <spring:message code="template.navigation.menuitem.myuser.label" /></a></li>
                                </c:otherwise>
                            </c:choose>
                            
                            <sec:authorize access="hasRole('ROLE_SUPERADMIN') or hasRole('ROLE_ADMIN') or hasRole('ROLE_TEST')">
                                <li class="divider-vertical"></li>
                                
                                <c:choose>
                                    <c:when test="${currentPage eq 'admin'}">
                                        <li class="active"><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin"><i class="icon-wrench"></i> <spring:message code="template.navigation.menuitem.adminsettings.label" /></a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin"><i class="icon-wrench"></i> <spring:message code="template.navigation.menuitem.adminsettings.label" /></a></li>
                                    </c:otherwise>
                                </c:choose>                                
                            </sec:authorize>
                                
                            <li class="divider-vertical"></li>
                                    
                            <li><a href="<c:out value="${pageContext.servletContext.contextPath}" />/logout"><i class="icon-off"></i> <spring:message code="template.navigation.menuitem.logout.label" /></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container container-content">            
            <ul class="nav nav-tabs">
                <c:choose>
                    <c:when test="${adminPage eq 'adminhome'}">
                        <li class="active"><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin"><spring:message code="template.subnavigation.menuitem.details.label" /></a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin"><spring:message code="template.subnavigation.menuitem.details.label" /></a></li>
                    </c:otherwise>
                </c:choose>
        
                <c:choose>
                    <c:when test="${adminPage eq 'adminmanagemovie'}">
                        <li class="active"><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/movie"><spring:message code="template.subnavigation.menuitem.managemovies.label" /></a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/movie"><spring:message code="template.subnavigation.menuitem.managemovies.label" /></a></li>
                    </c:otherwise>
                </c:choose>
                        
                <c:choose>
                    <c:when test="${adminPage eq 'adminmanageuser'}">
                        <li class="active"><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/user"><spring:message code="template.subnavigation.menuitem.manageusers.label" /></a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/user"><spring:message code="template.subnavigation.menuitem.manageusers.label" /></a></li>
                    </c:otherwise>
                </c:choose>
                        
                <c:choose>
                    <c:when test="${adminPage eq 'adminmanagegenre'}">
                        <li class="active"><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/genre"><spring:message code="template.subnavigation.menuitem.managegenres.label" /></a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/genre"><spring:message code="template.subnavigation.menuitem.managegenres.label" /></a></li>
                    </c:otherwise>
                </c:choose>
                        
                <c:choose>
                    <c:when test="${adminPage eq 'adminmanageseason'}">
                        <li class="active"><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/season"><spring:message code="template.subnavigation.menuitem.manageseasons.label" /></a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/season"><spring:message code="template.subnavigation.menuitem.manageseasons.label" /></a></li>
                    </c:otherwise>
                </c:choose>
                        
                <sec:authorize access="hasRole('ROLE_SUPERADMIN') or hasRole('ROLE_TEST')">
                    <c:choose>
                        <c:when test="${adminPage eq 'adminmanagesettings'}">
                            <li class="active pull-right"><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/settings"><spring:message code="template.subnavigation.menuitem.systemsettings.label" /></a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="pull-right"><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/settings"><spring:message code="template.subnavigation.menuitem.systemsettings.label" /></a></li>
                        </c:otherwise>
                    </c:choose>
                </sec:authorize>
            </ul>
            
            <tiles:insertAttribute name="content" />
        </div>
        
        <div class="container">
            <div id="footer" class="row">
                <div class="pull-left">
                    <p>&copy; 2013 <span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Movstream</span> <spring:message code="template.by.label" /> <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/martin-rohwedder/movstream" property="cc:attributionName" rel="cc:attributionURL">Martin Rohwedder</a></p>
                </div>
                <div id="cc-license" class="pull-right">
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
