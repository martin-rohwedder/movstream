package dk.movstream.web.security;

import dk.movstream.web.domain.User;
import dk.movstream.web.service.UserService;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
/**
 *
 * @author Martin Rohwedder
 * @since 16-03-2013
 * @version 1.0
 */
@Component("movstreamUserDetailsService")
public class MovstreamUserDetailsService implements UserDetailsService {

    @Autowired
    private UserService userService;
    
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        if (StringUtils.isBlank(username)) {
            throw new UsernameNotFoundException("Username was empty");
        }
        
        User user = userService.getUserByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException("User with username '" + username + "' was not found");
        }
        
        List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
        grantedAuthorities.add(new SimpleGrantedAuthority(user.getUserRole()));
        
        return new MovstreamUserDetails(user, grantedAuthorities);
    }

}
