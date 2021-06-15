public class WordSearchTree {
    final static int BASE = 97;
    
    class Node {
        Node[] children;
        boolean isWord;
        
        Node() {
            children = new Node[26];
            isWord = false;
        }
    }
    
    protected Node root;
    
    public WordSearchTree() {
        root = createNode();
    }
    
    public boolean contains(String word) {
        Node currentNode = root;
        
        for (int charIndex = 0; charIndex < word.length(); charIndex++) {
            int childIndex = word.charAt(charIndex) - BASE;
            if (currentNode.children[childIndex] == null) {
                return false;
            }
            currentNode = currentNode.children[childIndex];
        }
        
        return currentNode.isWord;
    }
    
    public void add(String word) {
        Node currentNode = root;
        
        for (int charIndex = 0; charIndex < word.length(); charIndex++) {
            int childIndex = word.charAt(charIndex) - BASE;
            if (currentNode.children[childIndex] == null) {
                currentNode.children[childIndex] = createNode();
                currentNode.children[childIndex].isWord = (charIndex+1) == word.length();
            }
            currentNode = currentNode.children[childIndex];
        }
    }
    
    protected Node createNode() {
        return new Node();
    }
}
