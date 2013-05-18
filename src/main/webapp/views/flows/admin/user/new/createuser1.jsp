<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form:form modelAttribute="userForm" action="${flowExecutionUrl}">

<div class="flow-container">

    <h3>New User</h3>

    <div class="span5">

        <p class="muted">Define a unique username</p>

        <div class="control-group">
            <label class="control-label" for="inputUsername"><strong>Username</strong></label>
            <div class="controls">
                <form:input class="span5" path="username" id="inputUsername" placeholder="Username" />
            </div>
        </div>

        <div class="control-group">
            <label class="control-label" for="inputUserRole"><strong>Role</strong></label>
            <div class="controls input-prepend">
                <span class="add-on" title="A role defines a users access level. Users with the normal role, has only acces to view movies, where users with the administrator role has far more options, like administrating movies and users."><i class="icon-question-sign"></i></span>
                <form:select path="userRole" class="span3">
                    <c:forEach items="${userRoles}" var="userRole">
                        <form:option value="${userRole.name}"><c:out value="${userRole.descriptiveName}" /></form:option>
                    </c:forEach>
                </form:select>
            </div>
        </div>
                    
    </div>

</div>

    <div class="control-group">
        <div class="controls">
            <button type="submit" class="btn btn-danger pull-left" id="end" name="_eventId_end"><i class="icon-remove-circle icon-white"></i> <strong>Cancel</strong></button>
            <button type="submit" class="btn btn-info pull-right" id="next" name="_eventId_next"><strong>Next</strong> <i class="icon-chevron-right icon-white"></i></button>
        </div>
    </div>
</form:form>

<div class="clearfix"></div>

<div>
    <hr />
        
    <p class="muted text-center">Step 1 of 2</p>
        
    <div class="progress progress-striped active">
        <div class="bar" data-percentage="0"></div>
    </div>
    
    <br />
</div>

<script type="text/javascript">
$(document).ready(function() {
    $('.progress .bar').progressbar({
        transition_delay: 400,
        display_text: 0
    });
});
</script>
