using System;
using System.Net.Mail;

namespace TheGreatEmailServer
{
    public interface MailObserver
    {
        void MailReceived(MailMessage mail);
        void MailRejected(MailMessage mail);
        void MailStored(MailMessage mail);
    }
}
