package dk.movstream.web.controller;

import dk.movstream.web.domain.Movie;
import dk.movstream.web.security.SecurityContextSupport;
import dk.movstream.web.service.GenreService;
import dk.movstream.web.service.MovieService;
import dk.movstream.web.service.SystemSettingsService;
import dk.movstream.web.util.Utility;
import java.io.File;
import java.io.IOException;
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
    @Autowired
    private GenreService genreService;
    
    @RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
    public ModelAndView renderHome(HttpServletRequest request) throws IOException {
        ModelAndView mav = new ModelAndView("home");
        HttpSession session = request.getSession();
        
        if (session.getAttribute("user") == null) {
            session.setAttribute("user", SecurityContextSupport.getUserDetails().getUser());
        }
        if (session.getAttribute("applicationTitle") == null) {
            session.setAttribute("applicationTitle", new SystemSettingsService().getApplicationTitle());
        }
        
        List<Movie> movies = movieService.getAllMoviesOrderedByTitle();
        SystemSettingsService settingsService = new SystemSettingsService();
        
        for (Movie movie : movies) {
            boolean externalLocationIsFound = false;
            File pictureFile = new File(settingsService.getLocalDirectory() + "images" + File.separator + movie.getPictureFilename());
            if (pictureFile.exists()) {
                movie.setPictureFilename("/movstream-files/images/" + movie.getPictureFilename());
            }
            else {
                if (!settingsService.getExternalLocations().equalsIgnoreCase("")) {
                    String externalLocationsString = settingsService.getExternalLocations().trim().replaceAll(" ", "");
                    String[] locations = externalLocationsString.split(",");
                    for (String location : locations) {
                        if (Utility.externalFileExists(location + "/images/" + movie.getPictureFilename())) {
                            movie.setPictureFilename(location + "/images/" + movie.getPictureFilename());

                            externalLocationIsFound = true;
                            break;
                        }
                    }
                    
                    if (!externalLocationIsFound) {
                        movie.setPictureFilename("pictureNotFound");
                    }
                } else {
                    movie.setPictureFilename("pictureNotFound");
                }
            }
        }
        
        mav.addObject("movies", Utility.sortMoviesAlphabetically(movies));
        mav.addObject("navGenres", genreService.getAllMovieGenresWithMovies());
        
        if (SecurityContextSupport.getUserDetails().getUser().getPassword().equals(org.apache.commons.codec.digest.DigestUtils.sha256Hex("default{" + SecurityContextSupport.getUserDetails().getUser().getUsername() + "}"))) {
            mav.addObject("changePasswordDialog", true);
        }
        
        return mav;
    }
    
}
