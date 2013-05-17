<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty param.created}">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong>Congratulations!</strong> Your movie has been created and saved in the database.</p>
    </div>
</c:if>

<c:if test="${not empty param.edited}">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong>Congratulations!</strong> Your movie has been updated in the database.</p>
    </div>
</c:if>

<c:if test="${not empty param.deleted}">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong>Congratulations!</strong> Your movie has been removed from the database.</p>
    </div>
</c:if>

<a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/movie/new" class="btn btn-success btn-small"><i class="icon-plus-sign icon-white"></i> Create Movie</a>

<br /><br />

<table class="table table-striped table-condensed table-bordered table-sorter">
    <thead>
        <tr>
            <th>#</th>
            <th>Movie Title</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${movies}" var="movie">
            <tr>
                <td style="width: 40px;"><c:out value="${movie.id}" /></td>
                <td><c:out value="${movie.title}" /></td>
                <td style="width: 80px;"><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/movie/edit?editMovieId=<c:out value="${movie.id}" />" class="btn btn-warning btn-mini"><i class="icon-edit icon-white"></i> Edit</a></td>
                <td style="width: 80px;"><a href="#modal-delete-container" data-id="<c:out value="${movie.id}" />" class="btn btn-danger btn-mini trigger-delete-movie"><i class="icon-remove-circle icon-white"></i> Delete</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div id="modal-delete-container" class="modal hide fade">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3>Delete Movie Permanently</h3>
    </div>
    <div class="modal-body">
        <p>You're about to delete a movie from the system. This action is permanently and can't be undone!</p>
        <p>Are you sure you want to continue?</p>
    </div>
    <div class="modal-footer">
        <a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/movie/delete?deleteMovieId=" class="btn btn-danger delete-movie-btn">Yes</a>
        <a href="" class="btn" data-dismiss="modal" aria-hidden="true">No</a>
    </div>
</div>

<script src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/sorttable.js"></script>

<script type="text/javascript">
    $('#modal-delete-container').bind('show', function() {
        var id = $(this).data('id'),
        removeBtn = $(this).find('.delete-movie-btn'),
        href = removeBtn.attr('href');
        
        removeBtn.attr('href', href.replace(/deleteMovieId=\d*/, 'deleteMovieId=' + id));
    })
    .modal({ backdrop: true, show: false });
    
    $('.trigger-delete-movie').click(function(e) {
        e.preventDefault();
        
        var id = $(this).data('id');
        $('#modal-delete-container').data('id', id).modal('show');
    });
</script>
