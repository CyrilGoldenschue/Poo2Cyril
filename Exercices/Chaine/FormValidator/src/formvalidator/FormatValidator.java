/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package formvalidator;

import sun.misc.Regexp;

/**
 *
 * @author phi
 */
public class FormatValidator implements Validator {
    protected String value;
    protected String regexp;

    public FormatValidator(String value, String regexp) {
        this.value = value;
        this.regexp = regexp;
    }

    public boolean isValid() {
        return value.matches(regexp);
    }
}
