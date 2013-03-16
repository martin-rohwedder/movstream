package dk.movstream.web.security;

import dk.movstream.web.domain.User;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
/**
 *
 * @author Martin Rohwedder
 * @since 16-03-2013
 * @version 1.0
 */
public class MovstreamUserDetails implements UserDetails {

    private User user;
    private List<? extends GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
    
    public MovstreamUserDetails(User user, List<? extends GrantedAuthority> authorities) {
        this.user = user;
        this.authorities = authorities;
    }
    
    public User getUser() {
        return this.user;
    }
    
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    @Override
    public String getPassword() {
        return this.user.getPassword();
    }

    @Override
    public String getUsername() {
        return this.user.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

}
