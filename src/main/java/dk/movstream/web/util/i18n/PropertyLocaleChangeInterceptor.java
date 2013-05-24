package dk.movstream.web.util.i18n;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Locale;
import java.util.Properties;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.propertyeditors.LocaleEditor;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;
/**
 *
 * @author Martin Rohwedder
 * @since 24-05-2013
 * @version 1.0
 */
public class PropertyLocaleChangeInterceptor extends HandlerInterceptorAdapter {

    private Properties prop = new Properties();
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
        Resource resource = new ClassPathResource("configuration/system.properties");
        prop.load(new FileInputStream(resource.getFile()));
        String newLocale = prop.getProperty("system.default.language").toLowerCase();
        
        if (newLocale != null) {
            LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);
            if (localeResolver == null) {
                throw new IllegalStateException("No LocaleResolver found: not in a DispatcherServlet request?");
            }
            LocaleEditor localeEditor = new LocaleEditor();
            localeEditor.setAsText(newLocale);
            localeResolver.setLocale(request, response, (Locale) localeEditor.getValue());
        }
        return true;
    }
    
}
