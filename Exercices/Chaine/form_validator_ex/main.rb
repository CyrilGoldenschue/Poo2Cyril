%w{simple_form simple_user_form form form_ex form_validator presence_validator format_validator email_validator user_form contact_form}.each {|file| require_relative file}

form = SimpleUserForm.new
form.firstname = 'Pascal'
form.lastname = 'Hurni'
form.email = 'phi@cpnv.ch'
puts "SimpleForm with validators and correct fields: #{form.valid?}"
# update fields with bad values and re-run the validation (note that we didn't re-create the form nor the validators chain!)
form.email = 'bla bla'
puts "SimpleForm with validators and bad fields: #{form.valid?}"

form = UserForm.new(firstname: 'Pascal', lastname: 'Hurni', email: 'phi@cpnv.ch')
form.add_validator(PresenceValidator.new(:firstname))
form.add_validator(EmailValidator.new(:email))
puts "Form with validators and correct fields: #{form.valid?}"
# update fields with bad values and re-run the validation (note that we didn't re-create the form nor the validators chain!)
form.firstname = "   "
form.email = "bla bla"
puts "Form with validators and bad fields: #{form.valid?}"

form = ContactForm.new(email: 'me@example.com', body: 'You rock!')
puts "Form with validators in the class and correct fields: #{form.valid?}"
# update fields with bad values and re-run the validation (note that we didn't re-create the form nor the validators chain!)
form.email = "bla bla"
puts "Form with validators in the class and bad fields: #{form.valid?}"
