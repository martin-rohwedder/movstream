package dk.movstream.web.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Version;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
/**
 *
 * @author Martin Rohwedder
 * @since 20-03-2013
 * @version 1.0
 */
@Component
@Scope("prototype")
@Entity
@Table(name = "movie")
public class Movie implements Serializable {
    
    private long id;
    private String title;
    private String description;
    private String movieFilename;
    private String pictureFilename;
    private int updateVersion;
    private Season season;
    private Genre genre;
    private MovieType movieType;
    private List<Subtitle> subtitles = new ArrayList<Subtitle>();

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Column(name = "TITLE")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(name = "DESCRIPTION")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Column(name = "MOVIE_FILENAME")
    public String getMovieFilename() {
        return movieFilename;
    }

    public void setMovieFilename(String movieFilename) {
        this.movieFilename = movieFilename;
    }

    @Column(name = "PICTURE_FILENAME")
    public String getPictureFilename() {
        return pictureFilename;
    }

    public void setPictureFilename(String pictureFilename) {
        this.pictureFilename = pictureFilename;
    }
    
    @Version
    @Column(name = "UPDATE_VERSION")
    public int getUpdateVersion() {
        return updateVersion;
    }

    public void setUpdateVersion(int updateVersion) {
        this.updateVersion = updateVersion;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "SEASON_ID")
    public Season getSeason() {
        return season;
    }

    public void setSeason(Season season) {
        this.season = season;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "GENRE_ID")
    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "MOVIE_TYPE_ID")
    public MovieType getMovieType() {
        return movieType;
    }

    public void setMovieType(MovieType movieType) {
        this.movieType = movieType;
    }

    @OneToMany(mappedBy = "movie", fetch = FetchType.EAGER)
    public List<Subtitle> getSubtitles() {
        return subtitles;
    }

    public void setSubtitles(List<Subtitle> subtitles) {
        this.subtitles = subtitles;
    }
    
    public void addSubtitle(Subtitle subtitle) {
        subtitle.setMovie(this);
        getSubtitles().add(subtitle);
    }
    
    public void removeSubtitleByIndex(int index) {
        getSubtitles().remove(index);
    }
    
    public void removeSubtitleByObject(Subtitle subtitle) {
        getSubtitles().remove(subtitle);
    }
    
}
