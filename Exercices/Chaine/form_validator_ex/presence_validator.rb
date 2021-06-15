class PresenceValidator < FormValidator
  def initialize(field_name)
    @field_name = field_name
  end
  
  def valid?
    !get_field_value(@field_name).strip.empty?
  end
end
