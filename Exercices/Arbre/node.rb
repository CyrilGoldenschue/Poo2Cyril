class Node

    def initialize(letter, endWord, depth)
        truc = "",
        
        @endWord = endWord,
        @letter = letter, 
        @depth = depth,
        @children = Array.new
        #@alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    end

    def add_child(new_node)
        @children.push(new_node)
        
    end

end