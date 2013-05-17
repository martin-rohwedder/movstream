package dk.movstream.web.service;

import dk.movstream.web.domain.Genre;
import dk.movstream.web.persistence.dao.GenreDao;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
/**
 *
 * @author Martin Rohwedder
 * @since 22-04-2013
 * @version 1.0
 */
@Service
public class GenreService {

    @Autowired
    @Qualifier("GenreDao")
    private GenreDao genreDao;
    
    public List<Genre> getAllMovieGenresWithMovies() {
        List<Genre> genres = this.genreDao.findAllMovieGenres();
        Genre myGenre = null;
        for (Genre genre : genres) {
            if (genre.getMovies().isEmpty()) {
                myGenre = genre;
            }
        }
        
        if (myGenre != null) {
            genres.remove(myGenre);
        }
        
        return genres;
    }
    
    public List<Genre> getAllMovieGenres() {
        return this.genreDao.findAllMovieGenres();
    }
    
    public void saveMovieGenre(Genre genre) {
        genreDao.insertMovieGenre(genre);
    }
    
    public Genre getGenreInstance() {
        return new Genre();
    }
    
}
