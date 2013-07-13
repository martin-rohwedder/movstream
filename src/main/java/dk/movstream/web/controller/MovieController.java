package dk.movstream.web.controller;

import dk.movstream.web.domain.Movie;
import dk.movstream.web.domain.Subtitle;
import dk.movstream.web.service.GenreService;
import dk.movstream.web.service.MovieService;
import dk.movstream.web.service.SystemSettingsService;
import dk.movstream.web.util.Utility;
import java.io.File;
import java.io.IOException;
import java.util.List;
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
    @Autowired
    private GenreService genreService;
    
    @RequestMapping(value = {"/season/showepisodes/{seasonId}"}, method = RequestMethod.GET)
    public ModelAndView renderSeasonEpisodes(@PathVariable("seasonId") long seasonId) {
        ModelAndView mav = new ModelAndView("showepisodes");
        mav.addObject("episodes", movieService.getAllMoviesBySeasonId(seasonId));
        mav.addObject("navGenres", genreService.getAllMovieGenresWithMovies());
        
        return mav;
    }
    
    @RequestMapping(value = {"/movie/show/{movieId}"}, method = RequestMethod.GET)
    public ModelAndView renderShowMovie(@PathVariable("movieId") long movieId) throws IOException {
        ModelAndView mav = new ModelAndView("showmovie");
        Movie movie = movieService.getMovieById(movieId);
        SystemSettingsService settingsService = new SystemSettingsService();
        boolean externalLocationIsFound = false;
        
        if (movie != null) {
            File movieFile = new File(settingsService.getLocalDirectory() + "movies" + File.separator + movie.getMovieFilename() + "." + movie.getMovieType().getName());
            
            if (movieFile.exists()) {
                movie.setMovieFilename("/movstream-files/movies/" + movie.getMovieFilename() + "." + movie.getMovieType().getName());

                for (Subtitle subtitle : movie.getSubtitles()) {
                    File subtitleFile = new File(settingsService.getLocalDirectory() + "subtitles" + File.separator + subtitle.getFilename() + ".vtt");
                    if (subtitleFile.exists()) {
                        subtitle.setFilename("/movstream-files/subtitles/" + subtitle.getFilename() + ".vtt");
                    }
                }
            } else {
                if (!settingsService.getExternalLocations().equalsIgnoreCase("")) {
                    String externalLocationsString = settingsService.getExternalLocations().trim().replaceAll(" ", "");
                    String[] locations = externalLocationsString.split(",");
                    for (String location : locations) {
                        if (Utility.externalFileExists(location + "/movies/" + movie.getMovieFilename() + "." + movie.getMovieType().getName())) {
                            movie.setMovieFilename(location + "/movies/" + movie.getMovieFilename() + "." + movie.getMovieType().getName());

                            for (Subtitle subtitle : movie.getSubtitles()) {
                                File subtitleFile = new File(settingsService.getLocalDirectory() + "subtitles" + File.separator + subtitle.getFilename() + ".vtt");
                                if (subtitleFile.exists()) {
                                    subtitle.setFilename("/movstream-files/subtitles/" + subtitle.getFilename() + ".vtt");
                                }
                            }

                            externalLocationIsFound = true;
                            break;
                        }
                    }
                    
                    if (!externalLocationIsFound) {
                        movie.setMovieFilename("movieNotFound");
                    }
                }
                else {
                    movie.setMovieFilename("movieNotFound");
                }
            }
        }
        
        mav.addObject("movie", movie);
        mav.addObject("externalMovie", externalLocationIsFound);
        mav.addObject("navGenres", genreService.getAllMovieGenresWithMovies());
        
        return mav;
    }
    
    @RequestMapping(value = {"/genre/{genreId}"}, method = RequestMethod.GET)
    public ModelAndView renderMoviesByGenre(@PathVariable("genreId") long genreId) throws IOException {
        ModelAndView mav = new ModelAndView("showmoviesbygenre");
        
        List<Movie> movies = movieService.getAllMoviesByGenreId(genreId);
        SystemSettingsService settingsService = new SystemSettingsService();
        boolean externalLocationIsFound = false;
        
        for (Movie movie : movies) {
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
        
        mav.addObject("movies", Utility.sortMoviesForAGenre(movies));
        mav.addObject("navGenres", genreService.getAllMovieGenresWithMovies());
        
        return mav;
    }
    
} //End of class MovieSeasonController
