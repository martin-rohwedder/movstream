package dk.movstream.web.controller;

import dk.movstream.web.domain.User;
import dk.movstream.web.security.SecurityContextSupport;
import dk.movstream.web.service.GenreService;
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
 * @since 19-05-2013
 * @version 1.0
 */
@Controller
@RequestMapping(value = {"/user"})
public class UserController {

    @Autowired
    private GenreService genreService;
    @Autowired
    private UserService userService;
    
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
        if (!org.apache.commons.codec.digest.DigestUtils.sha256Hex(oldPassword + "{" + SecurityContextSupport.getUserDetails().getUsername() + "}").equalsIgnoreCase(SecurityContextSupport.getUserDetails().getPassword())) {
            return "redirect:/user?passwordChanged=0";   //Redirect with error message about oldPassword is not matching with password in database.
        }
        else if (newPassword.length() < 6 || repeatNewPassword.length() < 6) {
            return "redirect:/user?passwordChanged=1";   //Redirect with error message about newPassword and repeatNewPassword is lower than 6 characters
        }
        else if (!newPassword.equals(repeatNewPassword)) {
            return "redirect:/user?passwordChanged=2";   //Redirect with error message about newPassword and repeatNewPassword is not matching each other.
        }
        else {
            User user = SecurityContextSupport.getUserDetails().getUser();
            user.setPassword(newPassword);
            userService.updateUser(user);
            
            return "redirect:/user?passwordChanged=3";   //Redirect with no error message.
        }
    }
    
}
