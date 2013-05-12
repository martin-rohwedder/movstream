package dk.movstream.web.service;

import dk.movstream.web.domain.Genre;
import dk.movstream.web.domain.Movie;
import dk.movstream.web.domain.MovieType;
import dk.movstream.web.domain.Season;
import dk.movstream.web.domain.Subtitle;
import dk.movstream.web.persistence.dao.MovieDao;
import java.util.ArrayList;
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
    
    public List<MovieType> getAllMovieTypes() {
        return movieDao.findAllMovieTypes();
    }
    
    /**
     * Retrieve a movie object with empty genre, season and subtitles.
     * @return Movie object
     */
    public Movie getMovieForm() {
        Movie movie = new Movie();
        movie.setGenre(new Genre());
        movie.setSeason(new Season());
        movie.setMovieType(new MovieType());
        movie.setSubtitles(new ArrayList<Subtitle>());
        
        return movie;   
    }
    
    public Movie noSeasonAssociatedToMovie(Movie movie) {
        movie.setSeason(null);
        return movie;
    }
    
    public Movie noSeasonAssociatedToMovieReverse(Movie movie) {
        if (movie.getSeason() == null)
        {
            movie.setSeason(new Season());
        }
        return movie;
    }
    
    public Subtitle getSubtitleInstance() {
        return new Subtitle();
    }
    
}
