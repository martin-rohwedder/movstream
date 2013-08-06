package dk.movstream.web.controller;

import dk.movstream.web.util.Utility;
import javax.servlet.http.HttpServletRequest;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
/**
 *
 * @author Martin Rohwedder
 * @since 16-03-2013
 * @version 1.0
 */
@Controller
public class AuthenticationController {

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public ModelAndView renderLogin(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("login");
        AuthenticationException authEx = (AuthenticationException) request.getSession().getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
        
        if (authEx != null) {
            mav.addObject("loginError", "An Error Occured! Please check that you have provided the correct username and password");
        }
        
        mav.addObject("versionNumber", Utility.getApplicationVersionNumber());
        
        return mav;
    }
    
}
