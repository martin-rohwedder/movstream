package dk.movstream.web.controller;

import dk.movstream.web.security.SecurityContextSupport;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/**
 *
 * @author Martin Rohwedder
 * @since 13-03-2013
 * @version 1.0
 */
@Controller
public class HomeController {

    @RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
    public String renderHome(HttpServletRequest request) {
        HttpSession session = request.getSession();
        
        if (session.getAttribute("user") == null) {
            session.setAttribute("user", SecurityContextSupport.getUserDetails().getUser());
        }
        
        return "home";
    }
    
}
