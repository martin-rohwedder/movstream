package dk.movstream.web.controller;

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
    public String renderHome() {
        return "home";
    }
    
}
