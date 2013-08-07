$(document).ready(function(){    
    var hasErrors = true;
    var errorCount = 0;
    
    //Page 1
    var titleGroupId = '#edit-movie-title-group';
    var genreGroupId = '#edit-movie-genre-group';
    var descriptionGroupId = '#edit-movie-description-group';
    
    //Page 1.5
    var genreTitleGroupId = '#edit-movie-genre-title-group';
    
    //Page 2
    var seasonGroupId = '#edit-movie-season-group';
    
    //Page 2.5
    var seasonTitleGroupId = '#edit-movie-season-title-group';
    var seasonDescriptionGroupId = '#edit-movie-season-description-group';
    
    //Page 3
    var filenameGroupId = '#edit-movie-filename-group';
    var pictureFilenameGroupId = '#edit-movie-picture-filename-group';
    
    //Page 4.5
    var subtitleFilenameGroupId = '#edit-movie-subtitle-filename-group';
    var subtitleLanguageGroupId = '#edit-movie-subtitle-language-group';
    var subtitleLangsrcGroupId = '#edit-movie-subtitle-langsrc-group';
    
    //Page 1 validation
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
    
    $('#inputGenre').bind('mousedown', function(){
        $(genreGroupId).removeClass('error');
        $(genreGroupId).addClass('success');
        hasErrors = false;
    });
    
    $('#inputDescription').bind('change blur keyup mouseup', function(){
        if ($(this).val().length === 0 || $(this).val().length > 255) {
            $(descriptionGroupId).removeClass('success');
            $(descriptionGroupId).addClass('error');
            hasErrors = true;
        } else {
            $(descriptionGroupId).removeClass('error');
            $(descriptionGroupId).addClass('success');
            hasErrors = false;
        }
    });
    
    //Page 1.5 validation
    $('#inputGenreTitle').bind('change blur keyup mouseup', function(){
        if ($(this).val().length === 0) {
            $(genreTitleGroupId).removeClass('success');
            $(genreTitleGroupId).addClass('error');
            hasErrors = true;
        } else {
            $(genreTitleGroupId).removeClass('error');
            $(genreTitleGroupId).addClass('success');
            hasErrors = false;
        }
    });
    
    //Page 2 validation
    $('#inputSeason').bind('mousedown', function(){
        $(seasonGroupId).removeClass('error');
        $(seasonGroupId).addClass('success');
        hasErrors = false;
    });
    
    //Page 2.5 validation
    $('#inputSeasonTitle').bind('change blur keyup mouseup', function(){
        if ($(this).val().length === 0) {
            $(seasonTitleGroupId).removeClass('success');
            $(seasonTitleGroupId).addClass('error');
            hasErrors = true;
        } else {
            $(seasonTitleGroupId).removeClass('error');
            $(seasonTitleGroupId).addClass('success');
            hasErrors = false;
        }
    });
    
    $('#inputSeasonDescription').bind('change blur keyup mouseup', function(){
        $(seasonDescriptionGroupId).removeClass('error');
        $(seasonDescriptionGroupId).addClass('success');
        hasErrors = false;
    });
    
    //Page 3 validation
    $('#inputMovieFilename').bind('change blur keyup mouseup', function(){
        if ($(this).val().length === 0) {
            $(filenameGroupId).removeClass('success');
            $(filenameGroupId).addClass('error');
            hasErrors = true;
        } else {
            $(filenameGroupId).removeClass('error');
            $(filenameGroupId).addClass('success');
            hasErrors = false;
        }
    });
    
    $('#inputPictureFilename').bind('change blur keyup mouseup', function(){
        $(pictureFilenameGroupId).removeClass('error');
        $(pictureFilenameGroupId).addClass('success');
        hasErrors = false;
    });
    
    //Page 4.5 validation
    $('#inputSubtitleFilename').bind('change blur keyup mouseup', function(){
        if ($(this).val().length === 0) {
            $(subtitleFilenameGroupId).removeClass('success');
            $(subtitleFilenameGroupId).addClass('error');
            hasErrors = true;
        } else {
            $(subtitleFilenameGroupId).removeClass('error');
            $(subtitleFilenameGroupId).addClass('success');
            hasErrors = false;
        }
    });
    
    $('#inputLanguage').bind('change blur keyup mouseup', function(){
        if ($(this).val().length === 0) {
            $(subtitleLanguageGroupId).removeClass('success');
            $(subtitleLanguageGroupId).addClass('error');
            hasErrors = true;
        } else {
            $(subtitleLanguageGroupId).removeClass('error');
            $(subtitleLanguageGroupId).addClass('success');
            hasErrors = false;
        }
    });
    
    $('#inputSrcLang').bind('change blur keyup mouseup', function(){
        if ($(this).val().length === 0) {
            $(subtitleLangsrcGroupId).removeClass('success');
            $(subtitleLangsrcGroupId).addClass('error');
            hasErrors = true;
        } else {
            $(subtitleLangsrcGroupId).removeClass('error');
            $(subtitleLangsrcGroupId).addClass('success');
            hasErrors = false;
        }
    });
    
    
    
    
    //Page 1 validation button
    $('#next1').click(function(e) {
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
        
        //Validate description
        if ($('#inputDescription').val().length === 0 || $('#inputDescription').val().length > 255) {
            $(descriptionGroupId).removeClass('success');
            $(descriptionGroupId).addClass('error');
            hasErrors = true;
            errorCount++;
        } else {
            $(descriptionGroupId).removeClass('error');
            $(descriptionGroupId).addClass('success');
            hasErrors = false;
        }
        
        if (hasErrors || errorCount > 0) {
            e.preventDefault();
            errorCount = 0;
        }
    });
    
    //Page 1.5 validation button
    $('#creategenre').click(function(e) {
        //Validate title
        if ($('#inputGenreTitle').val().length === 0) {
            $(genreTitleGroupId).removeClass('success');
            $(genreTitleGroupId).addClass('error');
            hasErrors = true;
            errorCount++;
        } else {
            $(genreTitleGroupId).removeClass('error');
            $(genreTitleGroupId).addClass('success');
            hasErrors = false;
        }
        
        if (hasErrors || errorCount > 0) {
            e.preventDefault();
            errorCount = 0;
        }
    });
    
    //Page 2.5 validation button
    $('#createseason').click(function(e) {
        //Validate title
        if ($('#inputSeasonTitle').val().length === 0) {
            $(seasonTitleGroupId).removeClass('success');
            $(seasonTitleGroupId).addClass('error');
            hasErrors = true;
            errorCount++;
        } else {
            $(seasonTitleGroupId).removeClass('error');
            $(seasonTitleGroupId).addClass('success');
            hasErrors = false;
        }
        
        if (hasErrors || errorCount > 0) {
            e.preventDefault();
            errorCount = 0;
        }
    });
    
    //Page 3 validation button
    $('#next3').click(function(e) {
        //Validate movie filename
        if ($('#inputMovieFilename').val().length === 0) {
            $(filenameGroupId).removeClass('success');
            $(filenameGroupId).addClass('error');
            hasErrors = true;
            errorCount++;
        } else {
            $(filenameGroupId).removeClass('error');
            $(filenameGroupId).addClass('success');
            hasErrors = false;
        }
        
        if (hasErrors || errorCount > 0) {
            e.preventDefault();
            errorCount = 0;
        }
    });
    
    //Page 4.5 validation button
    $('#createsubtitle').click(function(e) {
        //Validate subtitle filename
        if ($('#inputSubtitleFilename').val().length === 0) {
            $(subtitleFilenameGroupId).removeClass('success');
            $(subtitleFilenameGroupId).addClass('error');
            hasErrors = true;
            errorCount++;
        } else {
            $(subtitleFilenameGroupId).removeClass('error');
            $(subtitleFilenameGroupId).addClass('success');
            hasErrors = false;
        }
    
        if ($('#inputLanguage').val().length === 0) {
            $(subtitleLanguageGroupId).removeClass('success');
            $(subtitleLanguageGroupId).addClass('error');
            hasErrors = true;
            errorCount++;
        } else {
            $(subtitleLanguageGroupId).removeClass('error');
            $(subtitleLanguageGroupId).addClass('success');
            hasErrors = false;
        }
    
        if ($('#inputSrcLang').val().length === 0) {
            $(subtitleLangsrcGroupId).removeClass('success');
            $(subtitleLangsrcGroupId).addClass('error');
            hasErrors = true;
            errorCount++;
        } else {
            $(subtitleLangsrcGroupId).removeClass('error');
            $(subtitleLangsrcGroupId).addClass('success');
            hasErrors = false;
        }
        
        if (hasErrors || errorCount > 0) {
            e.preventDefault();
            errorCount = 0;
        }
    });
});
