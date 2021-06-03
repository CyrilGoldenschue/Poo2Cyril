class Logger {
    
    private static Logger instance;
    
    public static Logger getInstance() {
        // la 1er fois => new, les autres fois donne le
        if (instance == null) instance = new Logger();
        return instance;
    }
    
    private Logger() {
        
    }
    
    public void log(string message) {
        ...
    }
    
    

}