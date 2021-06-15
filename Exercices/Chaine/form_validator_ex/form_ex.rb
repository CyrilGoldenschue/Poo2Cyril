class FormEx < Form
  def initialize(*args)
    super
    set_validators
  end
  
  def set_validators
    self.class.validators.each {|(field, klass, args)| add_validator(klass.new(field, *args))}
  end
  
  class << self
    def validate(field, klass, *args)
      (@validators ||= []) << [field, klass, args]
    end
    
    attr_reader :validators
  end
end
