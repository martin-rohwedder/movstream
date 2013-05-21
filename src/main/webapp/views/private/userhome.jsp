<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1 class="page-header">My User</h1>

<c:if test="${param.passwordChanged == 3}">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <p><strong>Congratulations!</strong> Your password has been changed. You'll have to use it the next time you log in.</p>
    </div>
</c:if>

<p class="page-paragraph">Hello <c:out value="${user.username}" />! Go ahead and change your password if needed.</p>

<form class="form-horizontal" method="post">
    <c:choose>
        <c:when test="${param.passwordChanged == 0}">
    <div class="control-group error">
        <label class="control-label" for="inputOldPassword">Old Password</label>
        <div class="controls">
            <input class="span4" type="password" name="oldPassword" id="inputOldPassword" placeholder="Old Password">
            <span class="help-inline">Old password is not matching your current password</span>
        </div>
    </div>
        </c:when>
        <c:otherwise>
    <div class="control-group">
        <label class="control-label" for="inputOldPassword">Old Password</label>
        <div class="controls">
            <input class="span4" type="password" name="oldPassword" id="inputOldPassword" placeholder="Old Password">
        </div>
    </div>
        </c:otherwise>
    </c:choose>
    
    <c:choose>
        <c:when test="${param.passwordChanged == 1}">
    <div class="control-group error">
        <label class="control-label" for="inputNewPassword">New Password</label>
        <div class="controls">
            <input class="span4" type="password" name="newPassword" id="inputNewPassword" placeholder="New Password">
            <span class="help-inline">New Password need to be at least 6 characters long</span>
        </div>
    </div>
    
    <div class="control-group error">
        <label class="control-label" for="inputRepeatNewPassword">Repeat New Password</label>
        <div class="controls">
            <input class="span4" type="password" name="repeatNewPassword" id="inputRepeatNewPassword" placeholder="Repeat New Password">
            <span class="help-inline">New Password need to be at least 6 characters long</span>
        </div>
    </div>
        </c:when>
        <c:when test="${param.passwordChanged == 2}">
    <div class="control-group error">
        <label class="control-label" for="inputNewPassword">New Password</label>
        <div class="controls">
            <input class="span4" type="password" name="newPassword" id="inputNewPassword" placeholder="New Password">
        </div>
    </div>
    
    <div class="control-group error">
        <label class="control-label" for="inputRepeatNewPassword">Repeat New Password</label>
        <div class="controls">
            <input class="span4" type="password" name="repeatNewPassword" id="inputRepeatNewPassword" placeholder="Repeat New Password">
            <span class="help-inline">The two new passwords doesn't match each other</span>
        </div>
    </div>
        </c:when>
        <c:otherwise>
    <div class="control-group">
        <label class="control-label" for="inputNewPassword">New Password</label>
        <div class="controls">
            <input class="span4" type="password" name="newPassword" id="inputNewPassword" placeholder="New Password">
        </div>
    </div>
    
    <div class="control-group">
        <label class="control-label" for="inputRepeatNewPassword">Repeat New Password</label>
        <div class="controls">
            <input class="span4" type="password" name="repeatNewPassword" id="inputRepeatNewPassword" placeholder="Repeat New Password">
        </div>
    </div>
        </c:otherwise>
    </c:choose>

    <div class="control-group">
        <div class="controls">
            <button type="submit" class="btn btn-info btn-large">Change Password</button>
        </div>
    </div>
</form>
