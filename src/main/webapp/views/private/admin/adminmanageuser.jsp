<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:if test="${not empty param.created}">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong><spring:message code="overall.congratulations.label" />!</strong> <spring:message code="page.adminmanageuser.dialog.success.created.message" />.</p>
    </div>
</c:if>

<c:if test="${param.passwordReseted == 0}">
    <div class="alert alert-error">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong><spring:message code="overall.error.label" />!</strong> <spring:message code="page.adminmanageuser.dialog.error.passwordreset.message" />.</p>
    </div>
</c:if>

<c:if test="${param.passwordReseted == 1}">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong><spring:message code="overall.congratulations.label" />!</strong> <spring:message code="page.adminmanageuser.dialog.success.passwordreset.message" />.</p>
    </div>
</c:if>

<c:if test="${not empty param.edited}">
    <c:choose>
        <c:when test="${param.edited eq 1}">
            <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <p><strong><spring:message code="overall.congratulations.label" />!</strong> <spring:message code="page.adminmanageuser.dialog.success.edited.message" />.</p>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-danger">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <p><strong><spring:message code="overall.error.label" />!</strong> <spring:message code="page.adminmanageuser.dialog.error.edited.message" />.</p>
            </div>
        </c:otherwise>
    </c:choose>
</c:if>

<c:if test="${not empty param.deleted}">
    <c:choose>
        <c:when test="${param.deleted eq 1}">
            <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <p><strong><spring:message code="overall.congratulations.label" />!</strong> <spring:message code="page.adminmanageuser.dialog.success.deleted.message" />.</p>
            </div>
        </c:when>
        <c:when test="${param.deleted eq 2}">
            <div class="alert alert-danger">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <p><strong><spring:message code="overall.error.label" />!</strong> <spring:message code="page.adminmanageuser.dialog.error.deleted.yourownuser.message" />.</p>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-danger">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <p><strong><spring:message code="overall.error.label" />!</strong> <spring:message code="page.adminmanageuser.dialog.error.deleted.issuperadmin.message" />.</p>
            </div>
        </c:otherwise>
    </c:choose>
</c:if>

<a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/user/new" class="btn btn-success btn-small"><i class="icon-plus-sign icon-white"></i> <spring:message code="page.adminmanageuser.button.createuser.label" /></a>

<br /><br />

<table class="table table-striped table-condensed table-bordered table-sorter">
    <thead>
        <tr>
            <th>#</th>
            <th><spring:message code="page.adminmanageuser.table.username.label" /></th>
            <th><spring:message code="page.adminmanageuser.table.userrole.label" /></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <td style="width: 40px;"><c:out value="${user.id}" /></td>
                <td><c:out value="${user.username}" /></td>
                <td><c:out value="${userRoleListModel.getUserRoleDescrName(user.userRole)}" /></td>
                <td style="width: 80px;">
                    <a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/user/edit?editUserId=<c:out value="${user.id}" />" class="btn btn-warning btn-mini"><i class="icon-edit icon-white"></i> <spring:message code="page.adminmanageuser.button.edit.label" /></a>
                </td>
                <td style="width: 150px;">
                    <sec:authorize access="hasRole('ROLE_TEST')">
                        <a href="#modal-reset-password-container" data-id="<c:out value="${user.id}" />" class="btn btn-info btn-mini trigger-reset-password disabled"><i class="icon-repeat icon-white"></i> <spring:message code="page.adminmanageuser.button.resetpassword.label" /></a>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_SUPERADMIN') or hasRole('ROLE_ADMIN')">
                        <a href="#modal-reset-password-container" data-id="<c:out value="${user.id}" />" class="btn btn-info btn-mini trigger-reset-password"><i class="icon-repeat icon-white"></i> <spring:message code="page.adminmanageuser.button.resetpassword.label" /></a>
                    </sec:authorize>
                </td>
                <td style="width: 80px;">
                    <sec:authorize access="hasRole('ROLE_TEST')">
                        <a href="#modal-delete-container" data-id="<c:out value="${user.id}" />" class="btn btn-danger btn-mini trigger-delete-user disabled"><i class="icon-remove-circle icon-white"></i> <spring:message code="page.adminmanageuser.button.delete.label" /></a>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_SUPERADMIN') or hasRole('ROLE_ADMIN')">
                        <a href="#modal-delete-container" data-id="<c:out value="${user.id}" />" class="btn btn-danger btn-mini trigger-delete-user"><i class="icon-remove-circle icon-white"></i> <spring:message code="page.adminmanageuser.button.delete.label" /></a>
                    </sec:authorize>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div id="modal-delete-container" class="modal hide fade">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3><spring:message code="page.adminmanageuser.dialog.delete.headline.label" /></h3>
    </div>
    <div class="modal-body">
        <p><spring:message code="page.adminmanageuser.dialog.delete.infomessage.label" />!</p>
        <p><spring:message code="overall.info.areyousure.label" /></p>
    </div>
    <div class="modal-footer">
        <a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/user/delete?deleteUserId=" class="btn btn-danger delete-user-btn"><spring:message code="overall.yes.label" /></a>
        <a href="" class="btn" data-dismiss="modal" aria-hidden="true"><spring:message code="overall.no.label" /></a>
    </div>
</div>
        
<div id="modal-reset-password-container" class="modal hide fade">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3><spring:message code="page.adminmanageuser.dialog.resetpassword.headline.label" /></h3>
    </div>
    <div class="modal-body">
        <p><spring:message code="page.adminmanageuser.dialog.resetpassword.infomessage.label" />.</p>
        <p><spring:message code="overall.info.areyousure.label" /></p>
    </div>
    <div class="modal-footer">
        <a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/user/reset?resetPasswordUserId=" class="btn btn-info reset-password-btn"><spring:message code="overall.yes.label" /></a>
        <a href="" class="btn" data-dismiss="modal" aria-hidden="true"><spring:message code="overall.no.label" /></a>
    </div>
</div>

<script src="<c:out value="${pageContext.servletContext.contextPath}" />/resources/js/sorttable.js"></script>

<script type="text/javascript">
    $('#modal-delete-container').bind('show', function() {
        var id = $(this).data('id'),
        removeBtn = $(this).find('.delete-user-btn'),
        href = removeBtn.attr('href');
        
        removeBtn.attr('href', href.replace(/deleteUserId=\d*/, 'deleteUserId=' + id));
    })
    .modal({ backdrop: true, show: false });
    
    $('.trigger-delete-user').click(function(e) {
        e.preventDefault();
        
        if (!$(this).hasClass('disabled'))
        {
            var id = $(this).data('id');
            $('#modal-delete-container').data('id', id).modal('show');
        }
    });
    
    $('#modal-reset-password-container').bind('show', function() {
        var id = $(this).data('id'),
        removeBtn = $(this).find('.reset-password-btn'),
        href = removeBtn.attr('href');
        
        removeBtn.attr('href', href.replace(/resetPasswordUserId=\d*/, 'resetPasswordUserId=' + id));
    })
    .modal({ backdrop: true, show: false });
    
    $('.trigger-reset-password').click(function(e) {
        e.preventDefault();
        
        if (!$(this).hasClass('disabled'))
        {
            var id = $(this).data('id');
            $('#modal-reset-password-container').data('id', id).modal('show');
        }
    });
</script>
