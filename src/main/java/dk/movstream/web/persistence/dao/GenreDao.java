package dk.movstream.web.persistence.dao;

import dk.movstream.web.domain.Genre;
import java.util.List;
/**
 *
 * @author Martin Rohwedder
 * @since 22-04-2013
 * @version 1.0
 */
public interface GenreDao {

    List<Genre> findAllMovieGenres();
    void insertMovieGenre(Genre genre);
    Genre findGenreById(long id);
    
}
