/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package formvalidator;

import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author phi
 */
public class Form {
    protected HashMap<String, String> attributes;

    protected ArrayList<Validator> validators;

    public Form() {
        validators = new ArrayList();
        attributes = new HashMap();
    }

    public void addValidator(FormValidator validator) {
        validator.setForm(this);
        validators.add(validator);
    }

    public boolean isValid() {
        boolean result = true;
        for (Validator validator: validators) {
            result = result && validator.isValid();
        }
        return result;
    }

    public void setField(String name, String value) {
        attributes.put(name, value);
    }

    public String getField(String name) {
        return attributes.get(name);
    }

}
