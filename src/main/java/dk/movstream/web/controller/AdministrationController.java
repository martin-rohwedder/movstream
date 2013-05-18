package dk.movstream.web.controller;

import dk.movstream.web.security.SecurityContextSupport;
import dk.movstream.web.service.GenreService;
import dk.movstream.web.service.MovieService;
import dk.movstream.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
    private UserService userService;
    @Autowired
    private GenreService genreService;
    
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView renderAdminHome() {
        ModelAndView mav = new ModelAndView("adminhome");
        
        mav.addObject("navGenres", genreService.getAllMovieGenresWithMovies());
        
        return mav;
    }
    
    @RequestMapping(value = {"/movie"}, method = RequestMethod.GET)
    public ModelAndView renderManageMovie() {
        ModelAndView mav = new ModelAndView("adminmanagemovie");
        
        mav.addObject("movies", movieService.getAllMoviesOrderedById());
        mav.addObject("navGenres", genreService.getAllMovieGenresWithMovies());
        
        return mav;
    }
    
    @RequestMapping(value = {"/movie/delete"}, method = RequestMethod.GET)
    public String deleteMovieAction(@RequestParam(value = "deleteMovieId", required = true) Long id) {
        this.movieService.deleteMovie(id);
        return "redirect:/admin/movie?deleted=1";
    }
    
    @RequestMapping(value = {"/user"}, method = RequestMethod.GET)
    public ModelAndView renderManageUser() {
        ModelAndView mav = new ModelAndView("adminmanageuser");
        
        mav.addObject("navGenres", genreService.getAllMovieGenresWithMovies());
        mav.addObject("users", userService.getAllUsers());
        
        return mav;
    }
    
    @RequestMapping(value = {"/user/delete"}, method = RequestMethod.GET)
    public String deleteUserAction(@RequestParam(value = "deleteUserId", required = true) Long id) {
        if (id == 1) {
            return "redirect:/admin/user?deleted=0";
        }
        else if (SecurityContextSupport.getUserDetails().getUser().getId() == id) {
            return "redirect:/admin/user?deleted=2";
        }
        else {
            this.userService.deleteUser(id);
            return "redirect:/admin/user?deleted=1";
        }
    }
    
}
