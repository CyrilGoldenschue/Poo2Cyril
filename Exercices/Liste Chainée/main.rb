require './linkedlist'

list = LinkedList.new

puts "List empty? #{list.empty?}"

list.add_tail('C')
list.add_tail('O')
list.add_tail('O')
list.add_tail('L')
puts "List size: #{list.size}"

list.add_head('&')
list.add_head('H')
list.add_head('S')
list.add_head('E')
list.add_head('R')
list.add_head('F')
puts "List size: #{list.size}"

puts "List empty? #{list.empty?}"

# Affichage de la liste en utilisant le `each`
print "List: "
list.each {|value| print value}
puts

puts "RemoveHead: #{list.remove_head}"
puts "RemoveHead: #{list.remove_head}"
puts "RemoveHead: #{list.remove_head}"

puts "RemoveTail: #{list.remove_tail}"
puts "RemoveTail: #{list.remove_tail}"

# Affichage de la liste en ajoutant les pouvoirs de `Enumerable` à notre liste
list.extend Enumerable
puts "List: #{list.map(&:itself).join}"

# Test edge case
puts "RemoveHead: #{list.remove_head}"
puts "RemoveHead: #{list.remove_head}"
puts "RemoveHead: #{list.remove_head}"
puts "RemoveHead: #{list.remove_head}"
puts "RemoveHead: #{list.remove_head}"

puts "You should see an empty list exception now"
begin
  puts "RemoveHead: #{list.remove_head}"
rescue EmptyListError
  puts "!!! The list is empty !!!"
end
