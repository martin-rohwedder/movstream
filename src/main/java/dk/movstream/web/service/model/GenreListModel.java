package dk.movstream.web.service.model;

import dk.movstream.web.domain.Genre;
import dk.movstream.web.domain.Movie;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Martin Rohwedder
 * @since 10-05-2013
 * @version 1.0
 */
public class GenreListModel implements Serializable {

    private List<Genre> genres = new ArrayList<Genre>();

    public List<Genre> getGenres() {
        return genres;
    }

    public void setGenres(List<Genre> genres) {
        this.genres = genres;
    }
    
    public void addGenre(Genre genre) {
        this.genres.add(genre);
    }
    
    public Genre getGenreByTitle(String title) {
        Genre myGenre = new Genre();
        
        for (Genre genre : genres) {
            if (genre.getTitle().equalsIgnoreCase(title)) {
                myGenre.setId(genre.getId());
                myGenre.setTitle(genre.getTitle());
                myGenre.setUpdateVersion(genre.getUpdateVersion());
                for (Movie movie : genre.getMovies()) {
                    myGenre.addMovie(movie);
                }
            }
        }
        
        return myGenre;
    }
    
}
