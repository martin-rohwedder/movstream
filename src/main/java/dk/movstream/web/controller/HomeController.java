package dk.movstream.web.controller;

import dk.movstream.web.security.SecurityContextSupport;
import dk.movstream.web.service.GenreService;
import dk.movstream.web.service.MovieService;
import dk.movstream.web.util.Utility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
/**
 *
 * @author Martin Rohwedder
 * @since 13-03-2013
 * @version 1.0
 */
@Controller
public class HomeController {

    @Autowired
    private MovieService movieService;
    @Autowired
    private GenreService genreService;
    
    @RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
    public ModelAndView renderHome(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("home");
        HttpSession session = request.getSession();
        
        if (session.getAttribute("user") == null) {
            session.setAttribute("user", SecurityContextSupport.getUserDetails().getUser());
        }
        
        mav.addObject("movies", Utility.sortMoviesAlphabetically(movieService.getAllMoviesOrderedByTitle()));
        mav.addObject("navGenres", genreService.getAllMovieGenresWithMovies());
        
        if (SecurityContextSupport.getUserDetails().getUser().getPassword().equals(org.apache.commons.codec.digest.DigestUtils.sha256Hex("default{" + SecurityContextSupport.getUserDetails().getUser().getUsername() + "}"))) {
            mav.addObject("changePasswordDialog", true);
        }
        
        return mav;
    }
    
}
