import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class Main {

    public static void main(String[] args) throws IOException {
        if (args.length < 2) {
            System.out.println("Usage: wst <wordfile> <word_to_find>");
        }
        
        String filename = args[0];
        String wordToFind = args[1];
        
        ArrayList<String> functionsArray = new ArrayList<String>();
        BufferedReader reader = new BufferedReader(new FileReader(filename));
        try {
            while (reader.ready()) {
                functionsArray.add(reader.readLine());
            }
        } finally {
            reader.close();
        }
        
        WordSearchTree functionsTree = new WordSearchTree();
        for (String word: functionsArray) {
            functionsTree.add(word);
        }
        
        boolean wordFound = functionsTree.contains(wordToFind);
        System.out.println(wordFound ? "Found" : "Not found");
    }
}
