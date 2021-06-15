class WordBeginningVisitor
  attr_reader :matches
  
  def initialize(beginning)
    @beginning = beginning
    @matches = []
  end
  
  def visit(word)
    @matches << word if word.start_with? @beginning
  end
end
