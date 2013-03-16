package dk.movstream.web.security;

import org.springframework.security.core.context.SecurityContextHolder;
/**
 * SecurityContextSupport adds support for easy access to the principal object
 * (movstreamUserDetails) from the rest of the application.
 * 
 * @author Martin Rohwedder
 * @since 16-03-2013
 * @version 1.0
 */
public class SecurityContextSupport {

    /**
     * Get the principal (MovstreamUserDetails) object
     * @return the principal for the authenticated user.
     */
    public static MovstreamUserDetails getUserDetails() {
        return (MovstreamUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }
    
}
