import java.io.*;
import java.nio.file.*;
import java.nio.charset.*;
    
public class Main {

    public static void main(String[] args) throws IOException {
        String filename = "functions.txt";
        if (args.length >= 1) {
            filename = args[0];
        }

        BrowsableArray functionsArray = new BrowsableArray();
        BrowsableWordSearchTree functionsTree = new BrowsableWordSearchTree();

        BufferedReader reader = new BufferedReader(new FileReader(filename));
        try {
            while (reader.ready()) {
                String word = reader.readLine();
                functionsArray.add(word);
                functionsTree.add(word);
            }
        } finally {
            reader.close();
        }

        LengthVisitor lengthVisitor;

        lengthVisitor = new LengthVisitor(5);
        functionsArray.browse(lengthVisitor);
        Files.write(Paths.get("length_5_array.out"), lengthVisitor.getMatches(), Charset.forName("UTF-8"));

        lengthVisitor = new LengthVisitor(5);
        functionsTree.browse(lengthVisitor);
        Files.write(Paths.get("length_5_tree.out"), lengthVisitor.getMatches(), StandardCharsets.UTF_8);

        PrefixVisitor prefixVisitor;

        prefixVisitor = new PrefixVisitor("ha");
        functionsArray.browse(prefixVisitor);
        Files.write(Paths.get("starts_with_ha_array.out"), prefixVisitor.getMatches(), StandardCharsets.UTF_8);

        prefixVisitor = new PrefixVisitor("ha");
        functionsTree.browse(prefixVisitor);
        Files.write(Paths.get("starts_with_ha_tree.out"), prefixVisitor.getMatches(), StandardCharsets.UTF_8);
    }
}
