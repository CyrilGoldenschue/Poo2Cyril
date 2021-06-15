import java.util.ArrayList;

public class LengthVisitor implements WordsVisitor {
    protected int length;
    protected ArrayList<String> matches;
    
    public LengthVisitor(int length)
    {
        this.length = length;
        matches = new ArrayList<String>();
    }
    
    @Override
    public void visit(String word) {
        if (word.length() == length) {
            matches.add(word);
        }
    }
    
    public ArrayList<String> getMatches()
    {
        return matches;
    }
    
}
