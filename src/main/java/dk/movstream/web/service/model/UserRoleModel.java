package dk.movstream.web.service.model;

import java.io.Serializable;
/**
 *
 * @author Martin Rohwedder
 * @since 18-05-2013
 * @version 1.0
 */
public class UserRoleModel implements Serializable {
        
        private String name;
        private String descriptiveName;

        public UserRoleModel(String name, String descriptiveName) {
            this.name = name;
            this.descriptiveName = descriptiveName;
        }
        
        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getDescriptiveName() {
            return descriptiveName;
        }

        public void setDescriptiveName(String descriptiveName) {
            this.descriptiveName = descriptiveName;
        }
        
    }
