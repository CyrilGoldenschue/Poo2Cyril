/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package formvalidator;

/**
 *
 * @author phi
 */
public class PresenceValidator extends FormValidator {
    protected String field_name;

    public PresenceValidator(String field_name) {
        this.field_name = field_name;
    }

    public boolean isValid() {
        return !getFieldValue(field_name).trim().isEmpty();
    }
}
