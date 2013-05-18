<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form:form modelAttribute="userForm" action="${flowExecutionUrl}">

<div class="flow-container">

    <h3>New User</h3>

    <div class="span8">

        <p class="muted">Inspect the details of the user before saving in the database</p>

        <dl class="dl-horizontal">
            <dt>Username</dt>
            <dd><c:out value="${userForm.username}" /></dd>
            <dt>Role</dt>
            <dd><c:out value="${userRoleDescrName}" /></dd>
        </dl>
            
    </div>

</div>

    <div class="control-group">
        <div class="controls">
            <button type="submit" class="btn btn-info pull-left" id="back" name="_eventId_back"><i class="icon-chevron-left icon-white"></i> <strong>Back</strong></button>
            <button type="submit" class="btn btn-success pull-right" id="saveuser" name="_eventId_saveuser"><i class="icon-ok-circle icon-white"></i> <strong>Save User</strong></button>
        </div>
    </div>
</form:form>

<div class="clearfix"></div>

<div>
    <hr />
        
    <p class="muted text-center">Step 2 of 2</p>
        
    <div class="progress progress-striped active">
        <div class="bar" data-percentage="100"></div>
    </div>
    
    <br />
</div>

<script type="text/javascript">
$(document).ready(function() {
    $('.progress .bar').progressbar({
        transition_delay: 400,
        display_text: 1
    });
});
</script>
