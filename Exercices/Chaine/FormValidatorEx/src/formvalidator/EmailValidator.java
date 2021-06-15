/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package formvalidator;

/**
 *
 * @author phi
 */
public class EmailValidator extends FormatValidator {

    public EmailValidator(String field_name) {
        super(field_name, "[\\w_.-]+@[\\w_.-]+");
    }

}
