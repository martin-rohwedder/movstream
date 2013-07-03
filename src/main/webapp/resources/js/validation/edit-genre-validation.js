$(document).ready(function(){    
    var hasErrors = true;
    
    $('#inputTitle').bind('change blur keyup mouseup', function(){
        if ($(this).val().length === 0) {
            $('#edit-genre-title-group').removeClass('success');
            $('#edit-genre-title-group').addClass('error');
            hasErrors = true;
        } else {
            $('#edit-genre-title-group').removeClass('error');
            $('#edit-genre-title-group').addClass('success');
            hasErrors = false;
        }
    });
    
    $('#savegenre').click(function(e) {
        //Validate title
        if ($('#inputTitle').val().length === 0) {
            $('#edit-genre-title-group').removeClass('success');
            $('#edit-genre-title-group').addClass('error');
            hasErrors = true;
        } else {
            $('#edit-genre-title-group').removeClass('error');
            $('#edit-genre-title-group').addClass('success');
            hasErrors = false;
        }
        
        if (hasErrors) {
            e.preventDefault();
        }
    });
});
