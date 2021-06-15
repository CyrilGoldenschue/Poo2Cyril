import java.util.ArrayList;

public class BrowsableArray extends ArrayList<String> implements WordsBrowsable {

    @Override
    public void browse(WordsVisitor visitor) {
        for (String word: this) {
            visitor.visit(word);
        }
    }

}
