class ContactForm < FormEx
  validate :email, EmailValidator
  validate :body, PresenceValidator
end
