package dk.movstream.web.persistence.dao;

import dk.movstream.web.domain.Movie;
import java.util.List;
/**
 *
 * @author Martin Rohwedder
 * @since 22-03-2013
 * @version 1.0
 */
public interface MovieDao {

    List<Movie> findAllMoviesOrderedByTitle();
    List<Movie> findAllMoviesBySeasonId(long seasonId);
    Movie findMovieById(long movieId);
    List<Movie> findAllMoviesByGenreId(long genreId);
    
}
