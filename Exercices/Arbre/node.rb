class Node

    def initialize()
        @value = 0, 
        @children = Array.new
    end

    def add_child(new_node)
        @children.push(new_node)
    end

end