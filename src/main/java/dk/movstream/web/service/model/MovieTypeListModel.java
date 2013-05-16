package dk.movstream.web.service.model;

import dk.movstream.web.domain.Movie;
import dk.movstream.web.domain.MovieType;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Martin Rohwedder
 * @since 15-05-2013
 * @version 1.0
 */
public class MovieTypeListModel implements Serializable {

    private List<MovieType> movieTypes = new ArrayList<MovieType>();

    public List<MovieType> getMovieTypes() {
        return movieTypes;
    }

    public void setMovieTypes(List<MovieType> movieTypes) {
        this.movieTypes = movieTypes;
    }
    
    public MovieType getMovieTypeByName(String name) {
        MovieType myMovieType = new MovieType();
        
        for (MovieType movieType : movieTypes) {
            if (movieType.getName().equalsIgnoreCase(name)) {
                myMovieType.setId(movieType.getId());
                myMovieType.setName(movieType.getName());
                myMovieType.setUpdateVersion(movieType.getUpdateVersion());
                for (Movie movie : movieType.getMovies()) {
                    myMovieType.addMovie(movie);
                }
            }
        }
        
        return myMovieType;
    }
    
}
