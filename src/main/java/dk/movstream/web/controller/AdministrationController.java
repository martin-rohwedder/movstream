package dk.movstream.web.controller;

import dk.movstream.web.service.GenreService;
import dk.movstream.web.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping(value = {"/admin"})
public class AdministrationController {

    @Autowired
    private MovieService movieService;
    @Autowired
    private GenreService genreService;
    
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView renderAdminHome() {
        ModelAndView mav = new ModelAndView("adminhome");
        
        mav.addObject("navGenres", genreService.getAllMovieGenres());
        
        return mav;
    }
    
    @RequestMapping(value = {"/movie"}, method = RequestMethod.GET)
    public ModelAndView renderManageMovie() {
        ModelAndView mav = new ModelAndView("adminmanagemovie");
        
        mav.addObject("movies", movieService.getAllMoviesOrderedById());
        mav.addObject("navGenres", genreService.getAllMovieGenres());
        
        return mav;
    }
    
}
