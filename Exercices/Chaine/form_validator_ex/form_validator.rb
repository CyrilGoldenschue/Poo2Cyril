class FormValidator
  attr_accessor :form
  
  def get_field_value(field_name)
    form.send field_name
  end
end
