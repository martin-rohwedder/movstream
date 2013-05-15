package dk.movstream.web.service.model;

import dk.movstream.web.domain.Movie;
import dk.movstream.web.domain.Season;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Martin Rohwedder
 * @since 10-05-2013
 * @version 1.0
 */
public class SeasonListModel implements Serializable {

    private List<Season> seasons = new ArrayList<Season>();

    public List<Season> getSeasons() {
        return seasons;
    }

    public void setSeasons(List<Season> seasons) {
        this.seasons = seasons;
    }
    
    public void addSeason(Season season) {
        this.seasons.add(season);
    }
    
    public Season getSeasonByTitle(String title) {
        Season mySeason = new Season();
        
        for (Season season : seasons) {
            if (season.getTitle().equalsIgnoreCase(title)) {
                mySeason.setId(season.getId());
                mySeason.setTitle(season.getTitle());
                mySeason.setDescription(season.getDescription());
                mySeason.setUpdateVersion(season.getUpdateVersion());
                for (Movie movie : season.getMovies()) {
                    mySeason.addMovie(movie);
                }
            }
        }
        
        return mySeason;
    }
    
}
