class WordLengthVisitor
  attr_reader :matches
  
  def initialize(length)
    @length = length
    @matches = []
  end
  
  def visit(word)
    @matches << word if word.length == @length
  end
end
