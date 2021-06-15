class SimpleForm
  def initialize
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
