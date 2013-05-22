<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty param.edited}">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong>Congratulations!</strong> Your genre has been updated in the database.</p>
    </div>
</c:if>

<c:if test="${not empty param.deleted}">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong>Congratulations!</strong> Your genre and its associated movies, has been removed from the database.</p>
    </div>
</c:if>

<p class="muted">You can't create a new genre here, because a genre only can be created with a movie. You therefore have to create a new movie to create a new genre.</p>

<br />

<table class="table table-striped table-condensed table-bordered table-sorter">
    <thead>
        <tr>
            <th>#</th>
            <th>Genre</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${genres}" var="genre">
            <tr>
                <td style="width: 40px;"><c:out value="${genre.id}" /></td>
                <td><c:out value="${genre.title}" /></td>
                <td style="width: 80px;"><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/genre/edit?editGenreId=<c:out value="${genre.id}" />" class="btn btn-warning btn-mini"><i class="icon-edit icon-white"></i> Edit</a></td>
                <td style="width: 80px;"><a href="#modal-delete-container" data-id="<c:out value="${genre.id}" />" class="btn btn-danger btn-mini trigger-delete-genre"><i class="icon-remove-circle icon-white"></i> Delete</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div id="modal-delete-container" class="modal hide fade">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3>Delete Genre Permanently</h3>
    </div>
    <div class="modal-body">
        <p>You're about to delete a genre, and all its associated movies from the system. This action is permanently and can't be undone!</p>
        <p>Are you sure you want to continue?</p>
    </div>
    <div class="modal-footer">
        <a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/genre/delete?deleteGenreId=" class="btn btn-danger delete-genre-btn">Yes</a>
        <a href="" class="btn" data-dismiss="modal" aria-hidden="true">No</a>
    </div>
</div>

<script src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/sorttable.js"></script>

<script type="text/javascript">
    $('#modal-delete-container').bind('show', function() {
        var id = $(this).data('id'),
        removeBtn = $(this).find('.delete-genre-btn'),
        href = removeBtn.attr('href');
        
        removeBtn.attr('href', href.replace(/deleteGenreId=\d*/, 'deleteGenreId=' + id));
    })
    .modal({ backdrop: true, show: false });
    
    $('.trigger-delete-genre').click(function(e) {
        e.preventDefault();
        
        var id = $(this).data('id');
        $('#modal-delete-container').data('id', id).modal('show');
    });
</script>
