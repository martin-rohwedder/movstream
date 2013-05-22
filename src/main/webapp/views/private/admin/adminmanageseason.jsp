<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty param.edited}">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong>Congratulations!</strong> Your season has been updated in the database.</p>
    </div>
</c:if>

<c:if test="${not empty param.deleted}">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong>Congratulations!</strong> Your season and its associated movies, has been removed from the database.</p>
    </div>
</c:if>

<p class="muted">You can't create a new season here, because a season can only be created with a movie associated to it. You therefore have to create a new movie to create a new season.</p>

<br />

<table class="table table-striped table-condensed table-bordered table-sorter">
    <thead>
        <tr>
            <th>#</th>
            <th>Season</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${seasons}" var="season">
            <tr>
                <td style="width: 40px;"><c:out value="${season.id}" /></td>
                <td><c:out value="${season.title}" /></td>
                <td style="width: 80px;"><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/season/edit?editSeasonId=<c:out value="${season.id}" />" class="btn btn-warning btn-mini"><i class="icon-edit icon-white"></i> Edit</a></td>
                <td style="width: 80px;"><a href="#modal-delete-container" data-id="<c:out value="${season.id}" />" class="btn btn-danger btn-mini trigger-delete-season"><i class="icon-remove-circle icon-white"></i> Delete</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div id="modal-delete-container" class="modal hide fade">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3>Delete Season Permanently</h3>
    </div>
    <div class="modal-body">
        <p>You're about to delete a season, and all its associated movies from the system. This action is permanently and can't be undone!</p>
        <p>Are you sure you want to continue?</p>
    </div>
    <div class="modal-footer">
        <a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/season/delete?deleteSeasonId=" class="btn btn-danger delete-season-btn">Yes</a>
        <a href="" class="btn" data-dismiss="modal" aria-hidden="true">No</a>
    </div>
</div>

<script src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/sorttable.js"></script>

<script type="text/javascript">
    $('#modal-delete-container').bind('show', function() {
        var id = $(this).data('id'),
        removeBtn = $(this).find('.delete-season-btn'),
        href = removeBtn.attr('href');
        
        removeBtn.attr('href', href.replace(/deleteSeasonId=\d*/, 'deleteSeasonId=' + id));
    })
    .modal({ backdrop: true, show: false });
    
    $('.trigger-delete-season').click(function(e) {
        e.preventDefault();
        
        var id = $(this).data('id');
        $('#modal-delete-container').data('id', id).modal('show');
    });
</script>
