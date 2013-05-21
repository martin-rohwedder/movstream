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
    
    public User getUserById(long id) {
        return this.userDao.findUserById(id);
    }
    
    /**
     * Save a new user with default password. Password is hashed with an SHA256 encryption.
     * @param user
     */
    public void saveNewUser(User user) {
        user.setPassword(org.apache.commons.codec.digest.DigestUtils.sha256Hex("default{" + user.getUsername() + "}"));
        this.userDao.insertUser(user);
    }
    
    public void updateUser(User user) {
        user.setPassword(org.apache.commons.codec.digest.DigestUtils.sha256Hex(user.getPassword() + "{" + user.getUsername() + "}"));
        this.userDao.insertUser(user);
    }
    
    public void deleteUser(long id) {
        User user = this.getUserById(id);
        this.userDao.removeUser(user);
    }
    
    /**
     * Get a new user object used as a model attribute
     * @return user object
     */
    public User getUserForm() {
        return new User();
    }
    
    /**
     * Check if the user object has the role of super admin
     * @param user
     * @return true if user is super admin
     */
    public boolean isUserSuperAdmin(User user) {
        if (user.getUserRole().equalsIgnoreCase("ROLE_SUPERADMIN")) {
            return true;
        }
        else {
            return false;
        }
    }
    
}
