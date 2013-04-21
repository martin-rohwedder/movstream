<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1 class="page-header"><c:out value="${movie.title}" /></h1>

<p><c:out value="${movie.description}" /></p>

<video id="video-player" class="video-js vjs-default-skin" controls preload="none" width="700" height="450" data-setup="{}">
    <source src="http://video-js.zencoder.com/oceans-clip.mp4" type='video/mp4' />
    <!--<track kind="captions" src="captions.vtt" srclang="en" label="English" />-->
</video>