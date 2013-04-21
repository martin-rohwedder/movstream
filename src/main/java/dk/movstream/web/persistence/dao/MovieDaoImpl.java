package dk.movstream.web.persistence.dao;

import dk.movstream.web.domain.Movie;
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
    public Movie findMovieById(long movieId) {
        return (Movie) this.sessionFactory.getCurrentSession().createQuery("from Movie m where m.id = :ID").setParameter("ID", movieId).uniqueResult();
    }

    @Override
    public List<Movie> findAllMoviesByGenreId(long genreId) {
        return this.sessionFactory.getCurrentSession().createQuery("from Movie m where m.genre.id = :GENRE_ID order by m.title asc").setParameter("GENRE_ID", genreId).list();
    }

}
