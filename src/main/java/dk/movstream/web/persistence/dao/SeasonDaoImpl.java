package dk.movstream.web.persistence.dao;

import dk.movstream.web.domain.Season;
import java.util.List;
import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
/**
 *
 * @author Martin Rohwedder
 * @since 08-05-2013
 * @version 1.0
 */
@Repository("SeasonDao")
@Transactional
public class SeasonDaoImpl implements SeasonDao {

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
    public List<Season> findAllSeasons() {
        return this.sessionFactory.getCurrentSession().createQuery("from Season s order by s.title asc").list();
    }

    @Override
    @Transactional
    public void insertSeason(Season season) {
        this.sessionFactory.getCurrentSession().saveOrUpdate(season);
    }

    @Override
    @Transactional(readOnly=true)
    public Season findSeasonById(long id) {
        return (Season) this.sessionFactory.getCurrentSession().createQuery("from Season s where s.id = :ID").setParameter("ID", id).uniqueResult();
    }

}
