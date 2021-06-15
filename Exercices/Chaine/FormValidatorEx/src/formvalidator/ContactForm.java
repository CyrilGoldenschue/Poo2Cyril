/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package formvalidator;

/**
 *
 * @author phi
 */
public class ContactForm extends Form {

    public ContactForm(String email, String body) {
        setField("email", email);
        setField("body", body);
        setValidators();
    }

    public void setValidators() {
        addValidator(new EmailValidator("email"));
        addValidator(new PresenceValidator("body"));
    }

}
