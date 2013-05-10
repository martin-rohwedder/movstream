package dk.movstream.web.service.model;

import dk.movstream.web.domain.Genre;
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
    
}
