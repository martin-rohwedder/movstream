package dk.movstream.web.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Version;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
/**
 *
 * @author Martin Rohwedder
 * @since 16-03-2013
 * @version
 */
@Component
@Scope("prototype")
@Entity
@Table(name = "user")
public class User implements Serializable {

    private long id;
    private String username;
    private String password;
    private int updateVersion;
    private String userRole;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Column(name = "USERNAME", unique = true)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Column(name = "PASSWORD")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Version
    @Column(name = "UPDATE_VERSION")
    public int getUpdateVersion() {
        return updateVersion;
    }

    public void setUpdateVersion(int updateVersion) {
        this.updateVersion = updateVersion;
    }

    @Column(name = "USER_ROLE")
    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", username=" + username + ", password=" + password + ", updateVersion=" + updateVersion + ", role=" + userRole + "}";
    }
    
} //End of class User
