package dk.movstream.web.controller;

import dk.movstream.web.service.GenreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
    
    @RequestMapping(method = RequestMethod.POST)
    public String changePasswordAction(@RequestParam("oldPassword")String oldPassword, 
                                       @RequestParam("newPassword")String newPassword, 
                                       @RequestParam("repeatNewPassword")String repeatNewPassword)
    {
        if (newPassword.length() < 6 || repeatNewPassword.length() < 6) {
            return "redirect:/user?passwordChanged=2";
        }
        if (newPassword.equals(repeatNewPassword)) {
            return "redirect:/user?passwordChanged=1";
        }
        return "redirect:/user?passwordChanged=0";
    }
    
}
