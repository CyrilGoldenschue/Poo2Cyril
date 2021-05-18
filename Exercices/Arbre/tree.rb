require "./node"
class WordSearchTree

    def initialize
        @root = Node.new,
        @alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
      end

    def add_children
        @root.add_child(Node.new)
    end

    def fill_tree(list)
        list.each do |word|
            p word.chars
        end
    end








    def hello
        return "Hello World"
    end
end