package dk.movstream.web.controller;

import dk.movstream.web.service.GenreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
/**
 *
 * @author Martin Rohwedder
 * @since 19-05-2013
 * @version 1.0
 */
@Controller
@RequestMapping(value = {"/user"})
public class UserController {

    @Autowired
    private GenreService genreService;
    
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView renderUserPage() {
        ModelAndView mav = new ModelAndView("userhome");
        
        mav.addObject("navGenres", genreService.getAllMovieGenresWithMovies());
        
        return mav;
    }
    
}
