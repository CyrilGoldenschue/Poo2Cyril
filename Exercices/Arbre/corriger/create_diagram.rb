#
# POO2: Ex3
# Pascal Hurni May 2020
# 

require_relative 'visitable_word_search_tree'

def output_simple_diagram(tree, output = STDOUT, show_word_end: true)
  output.puts "digraph {"
  output.puts "node [shape=circle]"
  output.puts "node_root [shape=point]"
  
  tree.visit("node_root") do |node, node_id, child, child_index|
    if child
      child_label = (child_index+'a'.ord).chr
      child_id = "node_#{child.object_id}_#{child_label}"
    
      output.puts "#{child_id} [label=\"#{child_label}\" #{'shape=doublecircle' if show_word_end && child.word?}]"
      output.puts "#{node_id} -> #{child_id}"
    
      child_id
    end
  end

  output.puts "}"
end

def output_implementation_diagram(tree, output = STDOUT, show_word_end: true, show_hint: false)
  output.puts "digraph {"
  output.puts "node [shape=record]"

  record_subitems_refs = ('a'..'z').map {|char| "<#{char}> #{char if show_hint}" }.join('|')
  output.puts "node_root [label=\"{ |{#{record_subitems_refs}}}\"]"
  
  tree.visit("node_root") do |node, node_id, child, child_index|
    if child
      child_label = (child_index+'a'.ord).chr
      child_id = "node_#{child.object_id}_#{child_label}"
      
      output.puts "#{child_id} [label=\"{#{'word end' if show_word_end && child.word?} |{#{record_subitems_refs}}}\"]"
      output.puts "#{node_id}:#{child_label} -> #{child_id}"
    
      child_id
    end
  end

  output.puts "}"
end

if filename = ARGV.shift
  taken_percentage = (ARGV.shift || 10).to_i
  tree = VisitableWordSearchTree.new
  File.open(filename).each_slice(100) {|slice| slice.first(taken_percentage).each {|item| tree.insert(item.chomp) } }
  output_simple_diagram(tree)
  exit(0)
end

tree = VisitableWordSearchTree.new
tree.insert("zoo")
tree.insert("abs")
tree.insert("zone")
tree.insert("abbrev")
tree.insert("abbr")

output_simple_diagram(tree)
