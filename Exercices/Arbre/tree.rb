require "./node"
class WordSearchTree
    

    def initialize
        @root = Node.new("", false, 0)
    end

    def insert(word)
        i = 0
        node = ""
        allLetters = word.chars
        allLetters.each do |letter|
            endWord = false
            if(i == 0)
                @root.add_child(newNode = Node.new(letter,endWord,i+1))    
                  
            elsif(i == allLetters.size-1)
                endWord = true
                node.add_child(newNode = Node.new(letter,endWord,i+1)) 
            else
                node.add_child(newNode = Node.new(letter,endWord,i+1))        
            end
            i += 1
            node = newNode
        end
        p @root.children
        
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