require './word_search_tree'

class BrowsableWordSearchTree < WordSearchTree

  class Node < WordSearchTree::Node
    def browse(visitor, word)
      visitor.visit(word) if word?
      
      @children.each_with_index do |child, index|
        next unless child
        char = (BASE+index).chr
        child.browse(visitor, word + char)
      end
    end
  end

  def initialize
    @root = Node.new
  end

  def browse(visitor)
    @root.browse(visitor, '')
  end
end
