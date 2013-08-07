$(document).ready(function(){    
    var hasErrors = true;
    var errorCount = 0;
    
    var titleGroupId = '#edit-season-title-group';
    var descriptionGroupId = '#edit-season-description-group';
    
    $('#inputTitle').bind('change blur keyup mouseup', function(){
        if ($(this).val().length === 0) {
            $(titleGroupId).removeClass('success');
            $(titleGroupId).addClass('error');
            hasErrors = true;
        } else {
            $(titleGroupId).removeClass('error');
            $(titleGroupId).addClass('success');
            hasErrors = false;
        }
    });
    
    $('#inputDescription').bind('change blur keyup mouseup', function(){
        $(descriptionGroupId).removeClass('error');
        $(descriptionGroupId).addClass('success');
        hasErrors = false;
    });
    
    $('#saveseason').click(function(e) {
        //Validate title
        if ($('#inputTitle').val().length === 0) {
            $(titleGroupId).removeClass('success');
            $(titleGroupId).addClass('error');
            hasErrors = true;
            errorCount++;
        } else {
            $(titleGroupId).removeClass('error');
            $(titleGroupId).addClass('success');
            hasErrors = false;
        }
        
        if (hasErrors || errorCount > 0) {
            e.preventDefault();
            errorCount = 0;
        }
    });
});
