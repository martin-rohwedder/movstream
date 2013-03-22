package dk.movstream.web.controller;

import dk.movstream.web.domain.Movie;
import dk.movstream.web.security.SecurityContextSupport;
import dk.movstream.web.service.MovieService;
import java.util.ArrayList;
import java.util.List;
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
    
    @RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
    public ModelAndView renderHome(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("home");
        HttpSession session = request.getSession();
        
        if (session.getAttribute("user") == null) {
            session.setAttribute("user", SecurityContextSupport.getUserDetails().getUser());
        }
        
        mav.addObject("movies", sortMoviesAlphabetically());
        
        return mav;
    }
    
    /**
     * Sort movies after the movie titles first letter. If between 0 and 9, 
     * the movies need to be collected together. This is to provide the home view
     * with a list of movies which itself has an ordered list of movies which has the same
     * beginning letter in the movie title.
     * @return a list of movies which have been ordered into sublists.
     */
    private ArrayList<List<Movie>> sortMoviesAlphabetically() {
        List<Movie> movies = movieService.getAllMoviesOrderedByTitle();
        
        String letter = "";
        int index = -1;
        ArrayList<List<Movie>> myMovies = new ArrayList<List<Movie>>();
        
        for (Movie m : movies) {
            
            //if first letter in title equals the current letter iterated over, continue.
            if (m.getTitle().substring(0, 1).equalsIgnoreCase(letter)) {
                myMovies.get(index).add(m);
            }
            else {
                if (m.getTitle().substring(0, 1).matches("^[0-9]$")) {
                    if (index < 0) {
                        index = 0;
                        myMovies.add(new ArrayList<Movie>());
                    }
                    
                    myMovies.get(index).add(m);
                }
                else {
                    index++;
                    myMovies.add(new ArrayList<Movie>());
                    myMovies.get(index).add(m);
                }
            }
            
            letter = m.getTitle().substring(0, 1);
        }
        
        return myMovies;
    }
    
}
