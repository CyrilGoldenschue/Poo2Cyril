/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package formvalidator;

import java.util.ArrayList;

/**
 *
 * @author phi
 */
public class Form {
    protected ArrayList<Validator> validators;

    public Form() {
        validators = new ArrayList<Validator>();
    }

    public void addValidator(Validator validator) {
        validators.add(validator);
    }

    public boolean isValid() {
        boolean result = true;
        for (Validator validator: validators) {
            result = result && validator.isValid();
        }
        return result;
    }

}
