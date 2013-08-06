package dk.movstream.web.service;

import dk.movstream.web.domain.Genre;
import dk.movstream.web.persistence.dao.GenreDao;
import java.util.ArrayList;
import java.util.HashMap;
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
    
    public List<Genre> getAllMovieGenresWithMovies() {
        List<Genre> genres = this.genreDao.findAllMovieGenres();
        Genre myGenre = null;
        for (Genre genre : genres) {
            if (genre.getMovies().isEmpty()) {
                myGenre = genre;
            }
        }
        
        if (myGenre != null) {
            genres.remove(myGenre);
        }
        
        return genres;
    }
    
    /**
     * Retrieve a map containing the genre name and a percentage
     * value indicating the number of movies associated with that genre.
     * 
     * @return a Map with genre names and number of movies in percentage
     */
    public HashMap<String, Double> moviePercentageBasedOnGenres() {
        HashMap<String, Double> percentageMap = new HashMap<String, Double>();
        List<Genre> genres = new ArrayList<Genre>(this.getAllMovieGenresWithMovies());
        int totalNumberOfMovies = this.getTotalNumberOfMovies(genres);
        
        if (totalNumberOfMovies > 0)
        {
            for (Genre genre : genres) {
                //Get the percentage of movies to this specific genre.
                double percentage = Math.round((((double) genre.getMovies().size() / totalNumberOfMovies) * 100) * 100.0) / 100.0;
                percentageMap.put(genre.getTitle(), percentage);
            }
        }
        
        return percentageMap;
    }
    
    private int getTotalNumberOfMovies(List<Genre> genres)
    {
        int total = 0;
        for (Genre genre : genres) {
            total += genre.getMovies().size();
        }
        return total;
    }
    
    public List<Genre> getAllMovieGenres() {
        return this.genreDao.findAllMovieGenres();
    }
    
    public Genre getGenreById(long id) {
        return this.genreDao.findGenreById(id);
    }
    
    public void saveMovieGenre(Genre genre) {
        genreDao.insertMovieGenre(genre);
    }
    
    public Genre getGenreInstance() {
        return new Genre();
    }
    
    public void deleteMovieGenre(long id) {
        Genre genre = this.getGenreById(id);
        this.genreDao.removeMovieGenre(genre);
    }
    
}
