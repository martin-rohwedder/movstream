package dk.movstream.web.service;

import dk.movstream.web.domain.Movie;
import dk.movstream.web.persistence.dao.MovieDao;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
/**
 *
 * @author Martin Rohwedder
 * @since 22-03-2013
 * @version 1.0
 */
@Service
public class MovieService {

    @Autowired
    @Qualifier("MovieDao")
    private MovieDao movieDao;
    
    public List<Movie> getAllMovies() {
        return movieDao.findAllMovies();
    }
    
}
