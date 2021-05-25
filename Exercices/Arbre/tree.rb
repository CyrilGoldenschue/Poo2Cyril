
class WordSearchTree
    class Node

        def initialize(value, endWord)
            @value = value, 
            @children = Array.new,
            @endWord = endWord
            #@alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
        end
    
        def add_child(new_node)
            @children.push(new_node)
        end
    
    end

    def initialize
        @root = Node.new("ROOT", false)
    end

    def insert(word)
        i = 0
        node = ""
        allLetters = word.chars
        allLetters.each do |letter|
            if(i == 0)
                @root.add_child(node = Node.new(letter, false))    
                  
            elsif(i == allLetters.size-1)
                node.add_child(node = Node.new(letter, true)) 
            else
                @root.add_child(node = Node.new(letter, false))        
            end
            i += 1
        end

        p @root
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