/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package formvalidator;

/**
 *
 * @author phi
 */
public class PresenceValidator implements Validator {
    protected String value;

    public PresenceValidator(String value) {
        this.value = value;
    }

    public boolean isValid() {
        return !value.trim().isEmpty();
    }
}
