/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package formvalidator;

/**
 *
 * @author phi
 */
public class UserForm extends Form {

    public UserForm(String firstname, String lastname, String email) {
        setField("firstname", firstname);
        setField("lastname", lastname);
        setField("email", email);
    }
}
