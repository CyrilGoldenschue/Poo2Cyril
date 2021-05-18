require "./tree"

#tree = WordSearchTree.new
#p tree.hello

functions_array = File.readlines(ARGV[0] || 'functions.txt', chomp: true)

functions_tree = WordSearchTree.new
functions_tree.fill_tree(functions_array)