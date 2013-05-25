<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:if test="${not empty param.created}">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong><spring:message code="overall.congratulations.label" />!</strong> <spring:message code="page.adminmanagemovie.dialog.success.created.message" />.</p>
    </div>
</c:if>

<c:if test="${not empty param.edited}">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong><spring:message code="overall.congratulations.label" />!</strong> <spring:message code="page.adminmanagemovie.dialog.success.updated.message" />.</p>
    </div>
</c:if>

<c:if test="${not empty param.deleted}">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong><spring:message code="overall.congratulations.label" />!</strong> <spring:message code="page.adminmanagemovie.dialog.success.removed.message" />.</p>
    </div>
</c:if>

<a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/movie/new" class="btn btn-success btn-small"><i class="icon-plus-sign icon-white"></i> <spring:message code="page.adminmanagemovie.button.createmovie.label" /></a>

<br /><br />

<table class="table table-striped table-condensed table-bordered table-sorter">
    <thead>
        <tr>
            <th>#</th>
            <th><spring:message code="page.adminmanagemovie.table.movietitle.label" /></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${movies}" var="movie">
            <tr>
                <td style="width: 40px;"><c:out value="${movie.id}" /></td>
                <td><c:out value="${movie.title}" /></td>
                <td style="width: 80px;"><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/movie/edit?editMovieId=<c:out value="${movie.id}" />" class="btn btn-warning btn-mini"><i class="icon-edit icon-white"></i> <spring:message code="page.adminmanagemovie.button.edit.label" /></a></td>
                <td style="width: 80px;"><a href="#modal-delete-container" data-id="<c:out value="${movie.id}" />" class="btn btn-danger btn-mini trigger-delete-movie"><i class="icon-remove-circle icon-white"></i> <spring:message code="page.adminmanagemovie.button.delete.label" /></a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div id="modal-delete-container" class="modal hide fade">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3><spring:message code="page.adminmanagemovie.dialog.delete.headline.label" /></h3>
    </div>
    <div class="modal-body">
        <p><spring:message code="page.adminmanagemovie.dialog.delete.infolabel.label" />!</p>
        <p><spring:message code="overall.info.areyousure.label" /></p>
    </div>
    <div class="modal-footer">
        <a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/movie/delete?deleteMovieId=" class="btn btn-danger delete-movie-btn"><spring:message code="overall.yes.label" /></a>
        <a href="" class="btn" data-dismiss="modal" aria-hidden="true"><spring:message code="overall.no.label" /></a>
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
