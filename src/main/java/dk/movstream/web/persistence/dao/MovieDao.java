package dk.movstream.web.persistence.dao;

import dk.movstream.web.domain.Movie;
import dk.movstream.web.domain.MovieType;
import java.util.List;
/**
 *
 * @author Martin Rohwedder
 * @since 22-03-2013
 * @version 1.0
 */
public interface MovieDao {

    List<Movie> findAllMoviesOrderedById();
    List<Movie> findAllMoviesOrderedByTitle();
    List<Movie> findAllMoviesBySeasonId(long seasonId);
    Movie findMovieById(long movieId);
    Movie findMovieByMovieTitle(String movieTitle);
    List<Movie> findAllMoviesByGenreId(long genreId);
    List<MovieType> findAllMovieTypes();
    void insertMovie(Movie movie);
    void removeMovie(Movie movie);
    
}
