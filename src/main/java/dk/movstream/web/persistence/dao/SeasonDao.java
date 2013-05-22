package dk.movstream.web.persistence.dao;

import dk.movstream.web.domain.Season;
import java.util.List;
/**
 *
 * @author Martin Rohwedder
 * @since 08-05-2013
 * @version 1.0
 */
public interface SeasonDao {

    List<Season> findAllSeasons();
    void insertSeason(Season season);
    Season findSeasonById(long id);
    
}
