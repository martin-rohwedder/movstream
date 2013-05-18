package dk.movstream.web.persistence.dao;

import dk.movstream.web.domain.User;
import java.util.List;
import java.util.logging.Level;
import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Martin Rohwedder
 * @since 16-03-2013
 * @version
 */
@Repository("UserDao")
@Transactional
public class UserDaoImpl implements UserDao {
    
    private static final java.util.logging.Logger LOG = java.util.logging.Logger.getLogger(UserDaoImpl.class.getName());
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
    public List<User> findAll() {
        return this.sessionFactory.getCurrentSession().createQuery("from User u").list();
    }

    @Override
    @Transactional(readOnly=true)
    public User findUserByUsername(String username) {
        User user = (User) this.sessionFactory.getCurrentSession().createQuery("from User u where u.username = :USERNAME").setParameter("USERNAME", username).uniqueResult();
        LOG.log(Level.INFO, "User Object With ID {0} has been retrieved from the database!", user.getId());
        return user;
    }

    @Override
    @Transactional
    public void insertUser(User user) {
        this.sessionFactory.getCurrentSession().saveOrUpdate(user);
    }

    @Override
    public User findUserById(long id) {
        return (User) this.sessionFactory.getCurrentSession().createQuery("from User u where u.id = :ID").setParameter("ID", id).uniqueResult();
    }

    @Override
    public void removeUser(User user) {
        this.sessionFactory.getCurrentSession().delete(user);
    }

}
