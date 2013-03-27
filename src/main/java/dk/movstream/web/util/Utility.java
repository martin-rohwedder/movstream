package dk.movstream.web.util;

import dk.movstream.web.domain.Movie;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Martin Rohwedder
 * @since 27-03-2013
 * @version
 */
public class Utility {

    /**
     * Sort movies after the movie titles first letter. If between 0 and 9, 
     * the movies need to be collected together. This is to provide the home view
     * with a list of movies which itself has an ordered list of movies which has the same
     * beginning letter in the movie title.
     * @param a list of movies.
     * @return a list of movies which have been ordered into sublists.
     */
    public static ArrayList<List<Movie>> sortMoviesAlphabetically(List<Movie> movies) {
        String letter = "";
        int index = -1;
        ArrayList<List<Movie>> myMovies = new ArrayList<List<Movie>>();
        long seasonId = -1;
        
        for (Movie m : movies) {
            //if first letter in title equals the current letter iterated over, continue.
            if (m.getTitle().substring(0, 1).equalsIgnoreCase(letter)) {
                if (m.getSeason() == null) {
                    myMovies.get(index).add(m);
                } else {
                    if (seasonId != m.getSeason().getId()) {
                        myMovies.get(index).add(m);
                        seasonId = m.getSeason().getId();
                    }
                }
            } else {
                if (m.getTitle().substring(0, 1).matches("^[0-9]$")) {
                    if (index < 0) {
                        index = 0;
                        myMovies.add(new ArrayList<Movie>());
                    }

                    if (m.getSeason() == null) {
                        myMovies.get(index).add(m);
                    } else {
                        if (seasonId != m.getSeason().getId()) {
                            myMovies.get(index).add(m);
                            seasonId = m.getSeason().getId();
                        }
                    }
                } else {
                    if (m.getSeason() == null) {
                        index++;
                        myMovies.add(new ArrayList<Movie>());
                        myMovies.get(index).add(m);
                    } else {
                        if (seasonId != m.getSeason().getId()) {
                            index++;
                            myMovies.add(new ArrayList<Movie>());
                            myMovies.get(index).add(m);
                            seasonId = m.getSeason().getId();
                        }
                    }
                }
            }

            letter = m.getTitle().substring(0, 1);
        }
        
        return myMovies;
    }
    
}
