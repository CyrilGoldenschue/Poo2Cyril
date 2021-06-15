using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;

namespace TheGreatEmailServer
{
    class SpamBlocker
    {
        private List<SpamHandler> handlers;

        public SpamBlocker()
        {
            handlers = new List<SpamHandler>();
        }

        public void AddHandler(SpamHandler handler)
        {
            handlers.Add(handler);
        }

        public void RemoveHandler(SpamHandler handler)
        {
            handlers.Remove(handler);
        }

        public bool ShouldBlock(MailMessage mail)
        {
            return handlers.Any(handler => handler.ShouldBlock(mail));
        }
    }
}
