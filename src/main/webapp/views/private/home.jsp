<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class="page-header">All Movies</h1>

<p class="page-paragraph">Here is listed all the current availible movies in alphabetical order. If you want to filter the list of movies by genre, please select the genre at the top of the page. You can also do a search on a movie title or a part of it, by using the search box.</p>

<h3 class="muted">0-9</h3>
<hr />

<ul class="thumbnails">
    <li>
        <div rel="popover" data-content="<p>Etiam id felis sed tellus lacinia aliquet vel in dui. Donec eleifend semper nunc sed consectetur. Praesent tristique diam nec dolor scelerisque volutpat. Nam rhoncus sollicitudin ultricies. Morbi auctor facilisis commodo. Donec eu volutpat urna. Aliquam tempus venenatis nulla eget lobortis.</p><a href='#' class='btn btn-success btn-large btn-block'><i class='icon-play-circle icon-white'></i> Play Movie</a>" data-original-title="Title 1" class="thumbnail"><img src="http://placehold.it/160x200" alt="" /></div>
    </li>
    <li>
        <div rel="popover" data-content="<h1>Test 1</h1>" data-original-title="Title 1" class="thumbnail"><img src="http://placehold.it/160x200" alt="" /></div>
    </li>
    <li>
        <div rel="popover" data-content="<h1>Test 1</h1>" data-original-title="Title 1" class="thumbnail"><img src="http://placehold.it/160x200" alt="" /></div>
    </li>
</ul>

<h3 class="muted">A</h3>
<hr />

<ul class="thumbnails">
    <li>
        <div rel="popover" data-content="<h1>Test 1</h1>" data-original-title="Title 1" class="thumbnail"><img src="http://placehold.it/160x200" alt="" /></div>
    </li>
    <li>
        <div rel="popover" data-content="<h1>Test 1</h1>" data-original-title="Title 1" class="thumbnail"><img src="http://placehold.it/160x200" alt="" /></div>
    </li>
    <li>
        <div rel="popover" data-content="<h1>Test 1</h1>" data-original-title="Title 1" class="thumbnail"><img src="http://placehold.it/160x200" alt="" /></div>
    </li>
    <li>
        <div rel="popover" data-content="<h1>Test 1</h1>" data-original-title="Title 1" class="thumbnail"><img src="http://placehold.it/160x200" alt="" /></div>
    </li>
    <li>
        <div rel="popover" data-content="<h1>Test 1</h1>" data-original-title="Title 1" class="thumbnail"><img src="http://placehold.it/160x200" alt="" /></div>
    </li>
    <li>
        <div rel="popover" data-content="<h1>Test 1</h1>" data-original-title="Title 1" class="thumbnail"><img src="http://placehold.it/160x200" alt="" /></div>
    </li>
</ul>

<script type="text/javascript">
    $(document).ready(function(){
        $('.thumbnail').popover({
            placement: 'top',
            delay: 300,
            html: true
        }, 'show'); 
    });
</script>
