class BrowsableArray < Array
  def browse(visitor)
    each {|item| visitor.visit(item) }
  end
end
