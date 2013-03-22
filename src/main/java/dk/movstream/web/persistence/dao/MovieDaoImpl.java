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
    public List<Movie> findAllMovies() {
        return this.sessionFactory.getCurrentSession().createQuery("from Movie m").list();
    }

}
