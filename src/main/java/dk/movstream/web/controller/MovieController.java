package dk.movstream.web.controller;

import dk.movstream.web.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
/**
 *
 * @author martin
 * @since 23-03-2013
 * @version 1.0
 */
@Controller
public class MovieController {

    @Autowired
    private MovieService movieService;
    
    @RequestMapping(value = {"/season/showepisodes/{seasonId}"}, method = RequestMethod.GET)
    public ModelAndView renderSeasonEpisodes(@PathVariable("seasonId") long seasonId) {
        ModelAndView mav = new ModelAndView("showepisodes");
        mav.addObject("episodes", movieService.getAllMoviesBySeasonId(seasonId));
        
        return mav;
    }
    
    @RequestMapping(value = {"/movie/show/{movieId}"}, method = RequestMethod.GET)
    public ModelAndView renderShowMovie(@PathVariable("movieId") long movieId) {
        ModelAndView mav = new ModelAndView("showmovie");
        mav.addObject("movieId", movieId);
        
        return mav;
    }
    
} //End of class MovieSeasonController
