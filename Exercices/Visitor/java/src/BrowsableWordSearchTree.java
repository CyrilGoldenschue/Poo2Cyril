public class BrowsableWordSearchTree extends WordSearchTree implements WordsBrowsable {
    class Node extends WordSearchTree.Node {
        void browse(WordsVisitor visitor, String partialWord) {
            if (isWord) {
                visitor.visit(partialWord);
            }
            
            for (int childIndex = 0; childIndex < 26; childIndex++) {
                if (children[childIndex] != null) {
                    ((Node)children[childIndex]).browse(visitor, partialWord + (char)(BASE+childIndex));
                }
            }
        }
    }
    
    @Override
    public void browse(WordsVisitor visitor)
    {
        ((Node)root).browse(visitor, "");
    }

    @Override
    protected Node createNode() {
        return new Node();
    }
    
}
