package dk.movstream.web.service.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Martin Rohwedder
 * @since 18-05-2013
 * @version 1.0
 */
public class UserRoleListModel implements Serializable {

    private List<UserRoleModel> userRoles = new ArrayList<UserRoleModel>();

    public UserRoleListModel() {
        userRoles.add(new UserRoleModel("ROLE_ADMIN", "Administrator"));
        userRoles.add(new UserRoleModel("ROLE_NORMAL", "Normal"));
    }
    
    public List<UserRoleModel> getUserRoles() {
        return userRoles;
    }

    public void setUserRoles(List<UserRoleModel> userRoles) {
        this.userRoles = userRoles;
    }
    
    /**
     * Get the descriptive name for a specific user role.
     * @param name
     * @return the descriptive name
     */
    public String getUserRoleDescrName(String name) {
        String myName = "";
        
        for (UserRoleModel userRole: userRoles) {
            if (userRole.getName().equalsIgnoreCase(name)) {
                myName = userRole.getDescriptiveName();
            }
        }
        
        return myName;
    }
    
}
