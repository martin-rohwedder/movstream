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
    
    public List<Movie> getAllMoviesOrderedByTitle() {
        return movieDao.findAllMoviesOrderedByTitle();
    }
    
    public List<Movie> getAllMoviesBySeasonId(long seasonId) {
        return movieDao.findAllMoviesBySeasonId(seasonId);
    }
    
    public Movie getMovieById(long movieId) {
        return movieDao.findMovieById(movieId);
    }
    
    public List<Movie> getAllMoviesByGenreId(long genreId) {
        return movieDao.findAllMoviesByGenreId(genreId);
    }
    
    public List<Movie> getAllMoviesOrderedById() {
        return movieDao.findAllMoviesOrderedById();
    }
    
}
