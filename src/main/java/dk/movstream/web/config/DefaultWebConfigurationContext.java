package dk.movstream.web.config;

import dk.movstream.web.util.i18n.PropertyLocaleChangeInterceptor;
import dk.movstream.web.util.i18n.PropertyLocaleResolver;
import java.io.File;
import java.util.Locale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles2.TilesConfigurer;
import org.springframework.web.servlet.view.tiles2.TilesView;
/**
 *
 * @author Martin Rohwedder
 * @since 13-03-2013
 * @version 1.0
 */
@Configuration
@EnableWebMvc
@ComponentScan("dk.movstream.web")
@ImportResource({"classpath:/spring/tx-hibernate-context.xml", "classpath:/spring/security-context.xml", "classpath:/spring/webflow-config.xml"})
@PropertySource("classpath:/configuration/system.properties")
public class DefaultWebConfigurationContext extends WebMvcConfigurerAdapter {

    @Autowired
    Environment env;
    
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
        createLocalDirectories(env.getProperty("system.default.localDirectory"));
        registry.addResourceHandler("/movstream-files/**").addResourceLocations("file:" + env.getProperty("system.default.localDirectory"));
    }
    
    /**
     * Create Local directories for movies, subtitles and images
     * @param mainPath The main path to the local directory eg. C:\mymovies\
     */
    private void createLocalDirectories(String mainPath) {
        File file = new File(mainPath + "subtitles");
        file.mkdirs();
        file = new File(mainPath + "movies");
        file.mkdirs();
        file = new File(mainPath + "images");
        file.mkdirs();
    }
    
    @Bean
    public TilesConfigurer tilesConfigurer() {
        TilesConfigurer configurer = new TilesConfigurer();
        String[] definitions = {"/layout/layout.xml"};
        configurer.setDefinitions(definitions);
        return configurer;
    }
    
    @Bean
    public UrlBasedViewResolver tilesViewResolver() {
        UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
        viewResolver.setViewClass(TilesView.class);
        return viewResolver;
    }
    
    @Bean
    public LocaleResolver localeResolver() {
        PropertyLocaleResolver localeResolver = new PropertyLocaleResolver();
        localeResolver.setDefaultLocale(new Locale(env.getProperty("system.default.language").toLowerCase()));
        return localeResolver;
    }
    
    @Bean
    public MessageSource messageSource() {
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setBasenames("classpath:/languages/lang", "org.springframework.security.messages");
        messageSource.setUseCodeAsDefaultMessage(true);
        messageSource.setDefaultEncoding("UTF-8");
        messageSource.setCacheSeconds(0);
        return messageSource;
    }
    
    @Bean
    public HandlerInterceptor localeChangeInterceptor() {
        PropertyLocaleChangeInterceptor localeChangeInterceptor = new PropertyLocaleChangeInterceptor();
        return localeChangeInterceptor;
    }
    
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(localeChangeInterceptor());
    }
    
}
