package dk.movstream.web.service.model;

/**
 * Enum for a language used to determine the system language
 * 
 * @author Martin Rohwedder
 * @since 11-07-2013
 * @version 1.0
 */
public enum Language {
    
    DANISH("da", "Dansk"),
    ENGLISH("en", "English");
    
    private String code;
    private String name;
    
    /**
     * Constructor for enum objects
     * @param code The language code for the specific enum
     * @param name the language description for the specific enum
     */
    private Language(String code, String name) {
        this.code = code;
        this.name = name;
    }
    
    /**
     * Get the language code
     * 
     * @return The language code of the specific language
     */
    public String getCode() {
        return this.code;
    }
    
    /**
     * Set the language code
     * 
     * @param code the language code
     */
    public void setCode(String code) {
        this.code = code;
    }
    
    /**
     * Get the language descriptive name
     * 
     * @return The language descriptive name to the specific language
     */
    public String getName() {
        return this.name;
    }
    
    /**
     * Set the Language descriptive name
     * @param name a descriptive name for this language
     */
    public void setName(String name) {
        this.name = name;
    }
    
}
