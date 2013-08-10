<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:if test="${not empty param.edited}">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong><spring:message code="overall.congratulations.label" />!</strong> <spring:message code="page.adminmanageseason.dialog.success.edited.label" />.</p>
    </div>
</c:if>

<c:if test="${not empty param.deleted}">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong><spring:message code="overall.congratulations.label" />!</strong> <spring:message code="page.adminmanageseason.dialog.success.deleted.label" />.</p>
    </div>
</c:if>

<p class="muted"><spring:message code="page.adminmanageseason.pagedescription.label" />.</p>

<br />

<c:if test="${!season.isEmpty()}">

<table class="table table-striped table-condensed table-bordered table-sorter">
    <thead>
        <tr>
            <th>#</th>
            <th><spring:message code="page.adminmanageseason.table.seasontitle.label" /></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${seasons}" var="season">
            <tr>
                <td style="width: 40px;"><c:out value="${season.id}" /></td>
                <td><c:out value="${season.title}" /></td>
                <td style="width: 80px;"><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/season/edit?editSeasonId=<c:out value="${season.id}" />" class="btn btn-warning btn-mini"><i class="icon-edit icon-white"></i> <spring:message code="page.adminmanageseason.button.edit.label" /></a></td>
                <td style="width: 80px;">
                    <sec:authorize access="hasRole('ROLE_TEST')">
                    <a href="#modal-delete-container" data-id="<c:out value="${season.id}" />" class="btn btn-danger btn-mini trigger-delete-season disabled"><i class="icon-remove-circle icon-white"></i> <spring:message code="page.adminmanageseason.button.delete.label" /></a>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_SUPERADMIN') or hasRole('ROLE_ADMIN')">
                    <a href="#modal-delete-container" data-id="<c:out value="${season.id}" />" class="btn btn-danger btn-mini trigger-delete-season"><i class="icon-remove-circle icon-white"></i> <spring:message code="page.adminmanageseason.button.delete.label" /></a>
                    </sec:authorize>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</c:if>
        
<div id="modal-delete-container" class="modal hide fade">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3><spring:message code="page.adminmanageseason.dialog.delete.headline.label" /></h3>
    </div>
    <div class="modal-body">
        <p><spring:message code="page.adminmanageseason.dialog.delete.infomessage.label" />!</p>
        <p><spring:message code="overall.info.areyousure.label" /></p>
    </div>
    <div class="modal-footer">
        <a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/season/delete?deleteSeasonId=" class="btn btn-danger delete-season-btn"><spring:message code="overall.yes.label" /></a>
        <a href="" class="btn" data-dismiss="modal" aria-hidden="true"><spring:message code="overall.no.label" /></a>
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
        
        if (!$(this).hasClass('disabled'))
        {
            var id = $(this).data('id');
            $('#modal-delete-container').data('id', id).modal('show');
        }
    });
</script>
