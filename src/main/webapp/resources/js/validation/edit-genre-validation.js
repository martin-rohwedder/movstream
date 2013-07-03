$(document).ready(function(){    
    var hasErrors = true;
    
    var titleGroupId = '#edit-genre-title-group';
    
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
    
    $('#savegenre').click(function(e) {
        //Validate title
        if ($('#inputTitle').val().length === 0) {
            $(titleGroupId).removeClass('success');
            $(titleGroupId).addClass('error');
            hasErrors = true;
        } else {
            $(titleGroupId).removeClass('error');
            $(titleGroupId).addClass('success');
            hasErrors = false;
        }
        
        if (hasErrors) {
            e.preventDefault();
        }
    });
});
