using System;
using System.Text.RegularExpressions;
using System.Linq;
using System.Net.Mail;

namespace TheGreatEmailServer.SpamHandlers
{
    public class RecipientWhitelist : SpamHandler
    {
        private Regex whiteRegex;

        public RecipientWhitelist(dynamic config)
        {
            whiteRegex = new Regex(config);
        }
        
        public bool ShouldBlock(MailMessage mail)
        {
            return !mail.To.Any(address => whiteRegex.IsMatch(address.Address));
        }
    }
}