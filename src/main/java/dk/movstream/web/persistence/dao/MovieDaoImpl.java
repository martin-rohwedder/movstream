package dk.movstream.web.persistence.dao;

import dk.movstream.web.domain.Genre;
import dk.movstream.web.domain.Movie;
import dk.movstream.web.domain.MovieType;
import dk.movstream.web.domain.Season;
import dk.movstream.web.domain.Subtitle;
import java.util.List;
import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
/**
 *
 * @author Martin Rohwedder
 * @since 22-03-2013
 * @version
 */
@Repository("MovieDao")
@Transactional
public class MovieDaoImpl implements MovieDao {

    private SessionFactory sessionFactory;
    
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    @Resource(name = "sessionFactory")
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    @Override
    @Transactional(readOnly=true)
    public List<Movie> findAllMoviesOrderedByTitle() {
        return this.sessionFactory.getCurrentSession().createQuery("from Movie movie order by movie.title asc").list();
    }

    @Override
    @Transactional(readOnly=true)
    public List<Movie> findAllMoviesBySeasonId(long seasonId) {
        return this.sessionFactory.getCurrentSession().createQuery("from Movie movie where movie.season.id = :SEASON_ID").setParameter("SEASON_ID", seasonId).list();
    }

    @Override
    @Transactional(readOnly=true)
    public Movie findMovieById(long movieId) {
        return (Movie) this.sessionFactory.getCurrentSession().createQuery("from Movie m where m.id = :ID").setParameter("ID", movieId).uniqueResult();
    }

    @Override
    @Transactional(readOnly=true)
    public List<Movie> findAllMoviesByGenreId(long genreId) {
        return this.sessionFactory.getCurrentSession().createQuery("from Movie m where m.genre.id = :GENRE_ID order by m.title asc").setParameter("GENRE_ID", genreId).list();
    }

    @Override
    @Transactional(readOnly=true)
    public List<Movie> findAllMoviesOrderedById() {
        return this.sessionFactory.getCurrentSession().createQuery("from Movie movie order by movie.id asc").list();
    }

    @Override
    @Transactional(readOnly=true)
    public List<MovieType> findAllMovieTypes() {
        return this.sessionFactory.getCurrentSession().createQuery("from MovieType movietype").list();
    }

    @Override
    @Transactional
    public void insertMovie(Movie movie) {
        Genre genre = null;
        Season season = null;
        
        //Save the genre if we have a new genre.
        if (movie.getGenre().getId() == 0) {
            this.sessionFactory.getCurrentSession().saveOrUpdate(movie.getGenre());
        }
        
        //Save the season, if it's not yet created in the database.
        if (movie.getSeason() != null) {
            if (movie.getSeason().getId() == 0) {
                this.sessionFactory.getCurrentSession().saveOrUpdate(movie.getSeason());
            }
        }
        
        //Save the movie details, and get the new movie ID.
        this.sessionFactory.getCurrentSession().saveOrUpdate(movie);
    }

}
