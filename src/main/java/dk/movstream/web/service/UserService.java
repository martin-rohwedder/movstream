package dk.movstream.web.service;

import dk.movstream.web.domain.User;
import dk.movstream.web.persistence.dao.UserDao;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
/**
 *
 * @author Martin Rohwedder
 * @since 16-03-2013
 * @version 1.0
 */
@Service
public class UserService {

    @Autowired
    @Qualifier("UserDao")
    private UserDao userDao;
    
    public User getUserByUsername(String username) {
        return userDao.findUserByUsername(username);
    }
    
    public List<User> getAllUsers() {
        return this.userDao.findAll();
    }
    
}
