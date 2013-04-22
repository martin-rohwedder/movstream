package dk.movstream.web.domain;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Version;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
/**
 * A subtitle is associated to a single movie. A movie, can have more subtitles.
 * 
 * @author Martin Rohwedder
 * @since 22-04-2013
 * @version 1.0
 */
@Component
@Scope("prototype")
@Entity
@Table(name = "subtitle")
public class Subtitle implements Serializable {
    
    private Long id;
    private String filename;
    private String language;
    private int updateVersion;
    private Movie movie;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "FILENAME")
    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    @Column(name = "LANGUAGE")
    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
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
    @JoinColumn(name = "MOVIE_ID")
    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }
    
}
