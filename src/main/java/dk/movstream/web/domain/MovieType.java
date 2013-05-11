package dk.movstream.web.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Version;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
/**
 *
 * @author Martin Rohwedder
 * @since 11-05-2013
 * @version 1.0
 */
@Component
@Scope("prototype")
@Entity
@Table(name = "movie_type")
public class MovieType implements Serializable {

    private long id;
    private String name;
    private int updateVersion;
    private Set<Movie> movies = new HashSet<Movie>();

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Column(name = "NAME")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    @Version
    @Column(name = "UPDATE_VERSION")
    public int getUpdateVersion() {
        return updateVersion;
    }

    public void setUpdateVersion(int updateVersion) {
        this.updateVersion = updateVersion;
    }
    
    @OneToMany(mappedBy = "movieType", fetch = FetchType.EAGER)
    public Set<Movie> getMovies() {
        return this.movies;
    }

    public void setMovies(Set<Movie> movies) {
        this.movies = movies;
    }
    
    public void addMovie(Movie movie) {
        movie.setMovieType(this);
        getMovies().add(movie);
    }
    
    public void removeMovie(Movie movie) {
        getMovies().remove(movie);
    }
    
}
