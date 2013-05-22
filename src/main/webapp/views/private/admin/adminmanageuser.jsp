<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty param.created}">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong>Congratulations!</strong> Your user has been created and saved in the database. Please remember that the users password is 'default'. The user will be asked to change the password the first time he is logging in.</p>
    </div>
</c:if>

<c:if test="${param.passwordReseted == 0}">
    <div class="alert alert-error">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong>Error!</strong> You can't reset the super administrators password.</p>
    </div>
</c:if>

<c:if test="${param.passwordReseted == 1}">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong>Congratulations!</strong> The users password has been reseted. Remeber to provide them with the password <strong>default</strong>, which they can change after they log in.</p>
    </div>
</c:if>

<c:if test="${not empty param.edited}">
    <c:choose>
        <c:when test="${param.edited eq 1}">
            <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <p><strong>Congratulations!</strong> The user has been updated and saved to the database.</p>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-danger">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <p><strong>Error!</strong> The user is a super administrator, and can't be edited in the system. If you're logged in as an super administrator and want to change your password, then select 'My User' in the top navigation.</p>
            </div>
        </c:otherwise>
    </c:choose>
</c:if>

<c:if test="${not empty param.deleted}">
    <c:choose>
        <c:when test="${param.deleted eq 1}">
            <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <p><strong>Congratulations!</strong> The user has been deleted and removed from the database.</p>
            </div>
        </c:when>
        <c:when test="${param.deleted eq 2}">
            <div class="alert alert-danger">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <p><strong>Error!</strong> Your're not allowed to delete your own account. Contact the super administrator or another administrator, to get your account deleted.</p>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-danger">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <p><strong>Error!</strong> The user is a super administrator, and can't be deleted from the system.</p>
            </div>
        </c:otherwise>
    </c:choose>
</c:if>

<a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/user/new" class="btn btn-success btn-small"><i class="icon-plus-sign icon-white"></i> Create User</a>

<br /><br />

<table class="table table-striped table-condensed table-bordered table-sorter">
    <thead>
        <tr>
            <th>#</th>
            <th>Username</th>
            <th>Role</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <td style="width: 40px;"><c:out value="${user.id}" /></td>
                <td><c:out value="${user.username}" /></td>
                <td><c:out value="${userRoleListModel.getUserRoleDescrName(user.userRole)}" /></td>
                <td style="width: 80px;"><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/user/edit?editUserId=<c:out value="${user.id}" />" class="btn btn-warning btn-mini"><i class="icon-edit icon-white"></i> Edit</a></td>
                <td style="width: 150px;"><a href="#modal-reset-password-container" data-id="<c:out value="${user.id}" />" class="btn btn-info btn-mini trigger-reset-password"><i class="icon-repeat icon-white"></i> Reset Password</a></td>
                <td style="width: 80px;"><a href="#modal-delete-container" data-id="<c:out value="${user.id}" />" class="btn btn-danger btn-mini trigger-delete-user"><i class="icon-remove-circle icon-white"></i> Delete</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div id="modal-delete-container" class="modal hide fade">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3>Delete User Permanently</h3>
    </div>
    <div class="modal-body">
        <p>You're about to delete a user from the system. This action is permanently and can't be undone!</p>
        <p>Are you sure you want to continue?</p>
    </div>
    <div class="modal-footer">
        <a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/user/delete?deleteUserId=" class="btn btn-danger delete-user-btn">Yes</a>
        <a href="" class="btn" data-dismiss="modal" aria-hidden="true">No</a>
    </div>
</div>
        
<div id="modal-reset-password-container" class="modal hide fade">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3>Reset Password</h3>
    </div>
    <div class="modal-body">
        <p>You're about to reset the users password. The new password will be <strong>default</strong>, which you need to provide to the user. Users can after log in change the password to what they want.</p>
        <p>Are you sure you want to continue?</p>
    </div>
    <div class="modal-footer">
        <a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin/user/reset?resetPasswordUserId=" class="btn btn-info reset-password-btn">Yes</a>
        <a href="" class="btn" data-dismiss="modal" aria-hidden="true">No</a>
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
        
        var id = $(this).data('id');
        $('#modal-delete-container').data('id', id).modal('show');
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
        
        var id = $(this).data('id');
        $('#modal-reset-password-container').data('id', id).modal('show');
    });
</script>
