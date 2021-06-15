class SimpleUserForm < SimpleForm
  attr_accessor :firstname, :lastname, :email
  
  def initialize
    super
    add_validator(PresenceValidator.new(:firstname))
    add_validator(EmailValidator.new(:email))
  end
end
