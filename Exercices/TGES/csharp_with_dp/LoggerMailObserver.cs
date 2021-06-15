using System;
using System.Net.Mail;

using TheGreatEmailServer;

namespace Main
{
    public class LoggerMailObserver : MailObserver
    {
        public void MailReceived(MailMessage mail)
        {
            Console.WriteLine($"Received mail: {mail.From} {mail.To}");
        }

        public void MailRejected(MailMessage mail)
        {
            Console.WriteLine($"Rejected mail: {mail.From} {mail.To}");
        }

        public void MailStored(MailMessage mail)
        {
            Console.WriteLine($"Stored mail: {mail.From} {mail.To}");
        }
    }
}
