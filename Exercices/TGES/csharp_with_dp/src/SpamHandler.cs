using System;
using System.Net.Mail;

namespace TheGreatEmailServer
{
    public interface SpamHandler
    {
        bool ShouldBlock(MailMessage mail);
    }
}
