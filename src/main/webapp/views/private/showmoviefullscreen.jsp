<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<style>
html, body{
	background-color:black;
	height:99%;
	margin:0 auto;
}

#showdiv{
padding: 10px;
background: rgba(0,0,0, 0.2) url(<c:out value="${pageContext.servletContext.contextPath}" />/resources/img/back.png) no-repeat;
position: absolute;
top:60;
left:60;
z-index: 9999;
border-radius: 30px;
max-width: 300px;
text-align: center;
}

#showdiv h1{
	margin-top:80px;
	color:white;
}

#showdiv:hover{
background: rgba(0,0,0, 0.3) url(<c:out value="${pageContext.servletContext.contextPath}" />/resources/img/back-hover.png) no-repeat;
}

.showdiv-out{
	position: relative;
}

.mediaplayer video{
	width:100%;
	height:100%;
}

.movie-title-headline {
    font-family: "Arial";
    text-transform: capitalize;
}
</style>
<!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>-->
<script src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script>
 
var timedelay = 1;
function delayCheck()
{
if(timedelay == 5)
{
$('#showdiv').fadeOut('slow');
timedelay = 1;
}
timedelay = timedelay+1;
}
 
$(document).mousemove(function() {
$('#showdiv').fadeIn('slow');
timedelay = 1;
clearInterval(_delay);
_delay = setInterval(delayCheck, 670);
});
// page loads starts delay timer
_delay = setInterval(delayCheck, 670)
 
</script>

</head>
<body>

	<link href="<c:out value="${pageContext.servletContext.contextPath}" />/resources/css/player-styles.css" rel="stylesheet" />
	<script src="http://afarkas.github.io/webshim/js-webshim/minified/extras/modernizr-custom.js"></script>
	<script src="http://afarkas.github.io/webshim/js-webshim/minified/polyfiller.js"></script>
	<script>
		(!$.jme && document.write('<script src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/player/jme.full.min.js"><\/script>'));
	</script>

	<script>
		if($.webshims && $.webshims.setOptions){
			$.webshims.setOptions({
				track: {override: true}
			});
			$.webshims.polyfill('mediaelement');
		}

		$.jme.options.embeddedPlayer = 'embedded-player.html';
		$.jme.startJME();
	</script>

<c:choose>
    <c:when test="${not empty movie}">
        
        <c:choose>
            <c:when test="${movie.movieFilename eq 'movieNotFound'}">
                <h2><spring:message code="page.showmovie.nomoviefile.label" />!</h2>
            </c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test="${externalMovie eq true}">
                        <div class="showdiv-out">
                            <div class="mediaplayer" data-jme='{"controlbar": true}'>
                                <video controls="controls" autoplay="true" preload="true" poster="<c:out value="${pageContext.servletContext.contextPath}" />/resources/img/black_poster.jpg">
                                    <source src="<c:out value="${movie.movieFilename}" />" type="video/mp4" />
                                    <c:forEach items="${movie.subtitles}" var="subtitle">
                                        <track kind="subtitles" src="<c:out value="${pageContext.servletContext.contextPath}" /><c:out value="${subtitle.filename}" />" srclang="<c:out value="${subtitle.srcLang}" />" label="<c:out value="${subtitle.language}" />" default/>
                                    </c:forEach>
                                </video>
                                <a href="javascript:history.go(-1)"  onMouseOver="self.status=document.referrer;return true">
                                    <div id="showdiv">
                                        <h1 class="movie-title-headline"><c:out value="${movie.title}" /></h1>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="showdiv-out">
                            <div class="mediaplayer" data-jme='{"controlbar": true}'>
                                <video controls="controls" autoplay="true" preload="true" poster="<c:out value="${pageContext.servletContext.contextPath}" />/resources/img/black_poster.jpg">
                                    <source src="<c:out value="${pageContext.servletContext.contextPath}" /><c:out value="${movie.movieFilename}" />" type="video/mp4" />
                                    <c:forEach items="${movie.subtitles}" var="subtitle">
                                        <track kind="subtitles" src="<c:out value="${pageContext.servletContext.contextPath}" /><c:out value="${subtitle.filename}" />" srclang="<c:out value="${subtitle.srcLang}" />" label="<c:out value="${subtitle.language}" />" default/>
                                    </c:forEach>
                                </video>
                                <a href="javascript:history.go(-1)"  onMouseOver="self.status=document.referrer;return true">
                                    <div id="showdiv">
                                        <h1 class="movie-title-headline"><c:out value="${movie.title}" /></h1>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
               
    </c:when>
    <c:otherwise>
        <p class="lead text-center"><spring:message code="page.showmovie.nomovie.label" /></p>
    </c:otherwise>
</c:choose>



</body>
</html>