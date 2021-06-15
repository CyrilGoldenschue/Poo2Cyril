class EmailValidator < FormatValidator
  def initialize(field_name)
    super(field_name, /^[\w._-]+@[\w._-]+$/)
  end
end