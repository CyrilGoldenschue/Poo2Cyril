class Form
  def initialize(attributes)
    attributes.each do |attribute, value|
      self.class.send :attr_accessor, attribute
      self.send("#{attribute}=", value)
    end
    
    @validators = []
  end
  
  def add_validator(validator)
    validator.form = self
    @validators << validator
  end
  
  def valid?
    @validators.all? {|validator| validator.valid? }
  end
end
