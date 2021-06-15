using System;
using System.Net.Mail;

namespace TheGreatEmailServer.SpamHandlers
{
    public class BadWords : SpamHandler
    {
        public BadWords(dynamic config)
        {

        }

        public bool ShouldBlock(MailMessage mail)
        {
            return mail.Body.Contains("loup");
        }
    }
}