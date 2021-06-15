import java.util.ArrayList;

public class PrefixVisitor implements WordsVisitor {
    protected String prefix;
    protected ArrayList<String> matches;
    
    public PrefixVisitor(String prefix)
    {
        this.prefix = prefix;
        matches = new ArrayList<String>();
    }
    
    @Override
    public void visit(String word) {
        if (word.startsWith(prefix)) {
            matches.add(word);
        }
    }
    
    public ArrayList<String> getMatches()
    {
        return matches;
    }
}
