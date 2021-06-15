#
# POO2: Ex8
# Pascal Hurni June 2016
# 

require_relative 'browsable_array'
require_relative 'browsable_word_search_tree'

require_relative 'word_beginning_visitor'
require_relative 'word_length_visitor'

# Read the passed or default file containing function names
functions_array = BrowsableArray.new
File.foreach(ARGV[0] || 'functions.txt') {|line| functions_array << line.chomp }

# Insert them in the tree
functions_tree = BrowsableWordSearchTree.new
functions_array.each {|name| functions_tree.insert(name) }

# Browse both data structure
visitor = WordBeginningVisitor.new('ha')
functions_tree.browse(visitor)
File.write('starts_with_ha_tree.out', visitor.matches.join("\n"))

visitor = WordBeginningVisitor.new('ha')
functions_array.browse(visitor)
File.write('starts_with_ha_array.out', visitor.matches.join("\n"))

# Browse both data structure with another visitor
visitor = WordLengthVisitor.new(5)
functions_tree.browse(visitor)
File.write('length_5_tree.out', visitor.matches.join("\n"))

visitor = WordLengthVisitor.new(5)
functions_array.browse(visitor)
File.write('length_5_array.out', visitor.matches.join("\n"))
