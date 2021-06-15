/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package formvalidator;

/**
 *
 * @author phi
 */
public class FormatValidator extends FormValidator {
    protected String field_name;
    protected String regexp;

    public FormatValidator(String field_name, String regexp) {
        this.field_name = field_name;
        this.regexp = regexp;
    }

    public boolean isValid() {
        return getFieldValue(field_name).matches(regexp);
    }
}
