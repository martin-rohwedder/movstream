<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1 class="page-header">My User</h1>

<p class="page-paragraph">Hello <c:out value="${user.username}" />! Go ahead and change your password if needed.</p>

<form class="form-horizontal" method="post">
    <div class="control-group">
        <label class="control-label" for="inputOldPassword">Old Password</label>
        <div class="controls">
            <input class="span4" type="password" name="oldPassword" id="inputOldPassword" placeholder="Old Password">
        </div>
    </div>
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

    <div class="control-group">
        <div class="controls">
            <button type="submit" class="btn btn-info btn-large">Change Password</button>
        </div>
    </div>
</form>
