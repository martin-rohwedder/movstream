$(document).ready(function(){    
    var hasErrors = true;
    
    var usernameGroupId = '#new-user-username-group';
    var userroleGroupId = '#new-user-userrole-group';
    
    $('#inputUsername').bind('change blur keyup mouseup', function(){
        if ($(this).val().length === 0 || $(this).val().length < 4) {
            $(usernameGroupId).removeClass('success');
            $(usernameGroupId).addClass('error');
            hasErrors = true;
        } else {
            $(usernameGroupId).removeClass('error');
            $(usernameGroupId).addClass('success');
            hasErrors = false;
        }
    });
    
    //User Role is in a select element, and will always be without errors.
    $('#selectUserRole').bind('change blur keyup mouseup', function(){
        $(userroleGroupId).addClass('success');
        hasErrors = false;
    });
    
    $('#saveuser').click(function(e) {
        //Validate username        
        if ($('#inputUsername').val().length === 0 || $('#inputUsername').val().length < 4) {
            $(usernameGroupId).removeClass('success');
            $(usernameGroupId).addClass('error');
            hasErrors = true;
        } else {
            $(usernameGroupId).removeClass('error');
            $(usernameGroupId).addClass('success');
            hasErrors = false;
        }
        
        if (hasErrors) {
            e.preventDefault();
        }
    });
});

