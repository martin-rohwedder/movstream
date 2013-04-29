package dk.movstream.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
/**
 *
 * @author Martin Rohwedder
 * @since 29-04-2013
 * @version 1.0
 */
@Controller
public class AdministrationController {

    @RequestMapping(value = {"/admin"}, method = RequestMethod.GET)
    public ModelAndView renderAdminHome() {
        ModelAndView mav = new ModelAndView("adminhome");
        
        return mav;
    }
    
}
