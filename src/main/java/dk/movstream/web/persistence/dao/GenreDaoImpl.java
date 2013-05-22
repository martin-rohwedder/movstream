package dk.movstream.web.persistence.dao;

import dk.movstream.web.domain.Genre;
import java.util.List;
import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
/**
 *
 * @author Martin Rohwedder
 * @since 22-04-2013
 * @version 1.0
 */
@Repository("GenreDao")
@Transactional
public class GenreDaoImpl implements GenreDao {

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
    public List<Genre> findAllMovieGenres() {
        return this.sessionFactory.getCurrentSession().createQuery("from Genre g order by g.title asc").list();
    }

    @Override
    @Transactional
    public void insertMovieGenre(Genre genre) {
        this.sessionFactory.getCurrentSession().saveOrUpdate(genre);
    }

    @Override
    @Transactional(readOnly=true)
    public Genre findGenreById(long id) {
        return (Genre) this.sessionFactory.getCurrentSession().createQuery("from Genre g where g.id = :ID").setParameter("ID", id).uniqueResult();
    }

    @Override
    @Transactional
    public void removeMovieGenre(Genre genre) {
        this.sessionFactory.getCurrentSession().delete(genre);
    }

}
