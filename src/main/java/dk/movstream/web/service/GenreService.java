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
    
    public List<Genre> getAllMovieGenres() {
        return this.genreDao.findAllMovieGenres();
    }
    
}