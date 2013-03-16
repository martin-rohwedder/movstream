package dk.movstream.web.config;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import org.springframework.security.config.BeanIds;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.DispatcherServlet;
/**
 *
 * @author Martin Rohwedder
 * @since 13-03-2013
 * @version 1.0
 */
public class Initializer implements WebApplicationInitializer {

    @Override
    public void onStartup(ServletContext servletContext)
            throws ServletException {
        registerListener(servletContext);
        registerDispatcherServlet(servletContext);
        registerCharacterEncodingFilter(servletContext);
        registerSpringSecurityFilterChain(servletContext);
    }
    
    /**
     * Register the dispatcher servlet, which will function as the 'front' controller
     * or dispatcher for incoming requests
     * @param servletContext
     */
    private void registerDispatcherServlet(final ServletContext servletContext) {
        WebApplicationContext dispatcherContext = createContext(DefaultWebConfigurationContext.class);
        DispatcherServlet dispatcherServlet = new DispatcherServlet(dispatcherContext);
        ServletRegistration.Dynamic dispatcher = servletContext.addServlet("dispatcher", dispatcherServlet);
        dispatcher.setLoadOnStartup(1);
        dispatcher.addMapping("/");
    }
    
    private void registerListener(ServletContext servletContext) {
        AnnotationConfigWebApplicationContext rootContext = createContext(DefaultWebConfigurationContext.class);
        servletContext.addListener(new ContextLoaderListener(rootContext));
        servletContext.addListener(new RequestContextListener());
    }
    
    /**
     * Filter all incoming requests with character encoding UTF-8
     * @param servletContext 
     */
    private void registerCharacterEncodingFilter(ServletContext servletContext) {
        CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
        encodingFilter.setEncoding("UTF-8");
        encodingFilter.setForceEncoding(true);
        FilterRegistration.Dynamic characterEncodingFilter = servletContext.addFilter("characterEncodingFilter", encodingFilter);
        characterEncodingFilter.addMappingForUrlPatterns(null, false, "/*");
    }
    
        /**
     * Register the spring security filter chain which will check/filter each request
     * to find out if the request is permitted to the requested page.
     * @param servletContext 
     */
    private void registerSpringSecurityFilterChain(ServletContext servletContext) {
        FilterRegistration.Dynamic springSecurityFilterChain = servletContext.addFilter(BeanIds.SPRING_SECURITY_FILTER_CHAIN, new DelegatingFilterProxy());
        springSecurityFilterChain.addMappingForUrlPatterns(null, false, "/*");
    }
    
    /**
     * Create the Web Application Context
     * @param annotatedClasses
     * @return the web application context
     */
    private AnnotationConfigWebApplicationContext createContext(final Class<?>... annotatedClasses) {
        AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();
        context.register(annotatedClasses);
        return context;
    }

}
