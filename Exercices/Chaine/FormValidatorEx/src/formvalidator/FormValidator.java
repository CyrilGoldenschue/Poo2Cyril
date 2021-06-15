/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package formvalidator;

/**
 *
 * @author phi
 */
public abstract class FormValidator implements Validator {
    protected Form form;

    public void setForm(Form form) {
        this.form = form;
    }

    protected String getFieldValue(String field_name) {
        return form.getField(field_name);
    }
}
