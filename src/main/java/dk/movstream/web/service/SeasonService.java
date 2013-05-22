package dk.movstream.web.service;

import dk.movstream.web.domain.Season;
import dk.movstream.web.persistence.dao.SeasonDao;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
/**
 *
 * @author Martin Rohwedder
 * @since 08-05-2013
 * @version 1.0
 */
@Service
public class SeasonService {

    @Autowired
    @Qualifier("SeasonDao")
    private SeasonDao seasonDao;
    
    public List<Season> getAllSeasons() {
        return seasonDao.findAllSeasons();
    }
    
    public void saveSeason(Season season) {
        seasonDao.insertSeason(season);
    }
    
    public Season getSeasonById(long id) {
        return seasonDao.findSeasonById(id);
    }
    
    public void deleteSeason(long id) {
        Season season = this.getSeasonById(id);
        this.seasonDao.removeSeason(season);
    }
    
    public Season getSeasonInstance() {
        return new Season();
    }
    
}
