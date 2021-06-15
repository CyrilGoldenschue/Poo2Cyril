/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package formvalidator;

/**
 *
 * @author phi
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        UserForm form = new UserForm("Pascal", "Hurni", "phi@cpnv.ch");
        System.out.println("Form without validators: " + form.isValid());

        form.addValidator(new PresenceValidator(form.getFirstname()));
        form.addValidator(new EmailValidator(form.getEmail()));
        System.out.println("Form with validators and correct fields: " + form.isValid());

        UserForm bad_form = new UserForm("   ", "<script>alert('you b**')</script>", "bla bla");
        bad_form.addValidator(new PresenceValidator(bad_form.getFirstname()));
        bad_form.addValidator(new EmailValidator(bad_form.getEmail()));
        System.out.println("Form with validators and bad fields: " + bad_form.isValid());

    }

}
