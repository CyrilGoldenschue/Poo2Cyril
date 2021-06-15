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

        form.addValidator(new PresenceValidator("firstname"));
        form.addValidator(new EmailValidator("email"));
        System.out.println("Form with validators and correct fields: " + form.isValid());

        // update fields with bad values and re-run the validation
        // Note that we didn't re-create the form nor the validators chain!
        form.setField("firstname", "   ");
        form.setField("email", "bla bla");
        System.out.println("Form with validators and bad fields: " + form.isValid());
        
        // Now use a form with validators defined in the class
        ContactForm form2 = new ContactForm("me@example.com", "You rock!");
        System.out.println("Form with validators in the class: " + form2.isValid());

    }

}
