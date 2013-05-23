package dk.movstream.web.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Locale;
import java.util.Properties;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.LocaleResolver;
/**
 *
 * @author Martin Rohwedder
 * @since 23-05-2013
 * @version 1.0
 */
public class PropertyLocaleResolver implements LocaleResolver {

    private Properties prop = new Properties();
    private Locale defaultLocale = new Locale("en");
    
    public void setDefaultLocale(Locale locale) {
        this.defaultLocale = locale;
    }
    
    @Override
    public Locale resolveLocale(HttpServletRequest request) {
        return this.defaultLocale;
    }

    @Override
    public void setLocale(HttpServletRequest request, HttpServletResponse response, Locale locale) {
        try {
            this.prop.load(new FileInputStream("classpath:/configuration/system.properties"));
            this.defaultLocale = new Locale(this.prop.getProperty("system.default.language"));
        }
        catch (IOException e) {
            this.defaultLocale = (defaultLocale != null ? defaultLocale : new Locale("en"));
        }
    }

}
