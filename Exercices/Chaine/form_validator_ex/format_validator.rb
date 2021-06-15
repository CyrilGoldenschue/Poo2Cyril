class FormatValidator < FormValidator
  def initialize(field_name, format)
    @field_name, @format = field_name, format
  end
  
  def valid?
    get_field_value(@field_name) =~ @format
  end
end
