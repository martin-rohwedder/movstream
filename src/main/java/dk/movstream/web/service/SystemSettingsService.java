package dk.movstream.web.service;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
/**
 *
 * @author Martin Rohwedder
 * @since 24-05-2013
 * @version 1.0
 */
@Service
public class SystemSettingsService {

    private final String SYSTEM_SETTINGS_FILEPATH = "/configuration/system.properties";
    private final Resource SYSTEM_SETTINGS_FILE = new ClassPathResource(SYSTEM_SETTINGS_FILEPATH);
    
    private final Properties SYSTEM_SETTINGS_PROPERTIES = new Properties();
    
    private String languageCode = null;
    
    public SystemSettingsService() throws IOException {
        Properties prop = new Properties();
        prop.load(new FileInputStream(SYSTEM_SETTINGS_FILE.getFile()));
        
        this.languageCode = prop.getProperty("system.default.language");
    }
    
    public void setLanguageCode(String languageCode) {
        this.languageCode = languageCode;
    }
    
    public String getLanguageCode() {
        return this.languageCode;
    }
    
    public void saveSystemSettings() throws IOException {
        SYSTEM_SETTINGS_PROPERTIES.setProperty("system.default.language", this.languageCode);
        SYSTEM_SETTINGS_PROPERTIES.store(new FileOutputStream(SYSTEM_SETTINGS_FILE.getFile()), null);
    }
    
}
