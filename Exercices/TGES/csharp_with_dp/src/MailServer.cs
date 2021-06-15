using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Mail;

namespace TheGreatEmailServer
{
    public class MailServer
    {
        public class Config
        {
            public string storeLocation;
            public List<ValueTuple<string, string>> spamHandlers = new List<(string, string)>();
        }

        private Config config;

        private SpamBlocker spamBlocker;

        private List<MailObserver> observers;

        public MailServer(Config config)
        {
            this.config = config;

            spamBlocker = new SpamBlocker();
            foreach ((string handlerName, string handlerConfig) in config.spamHandlers)
            {
                spamBlocker.AddHandler(SpamHandlerFactory.Create(handlerName, handlerConfig));
            }

            observers = new List<MailObserver>();
        }

        public void Subscribe(MailObserver observer)
        {
            observers.Add(observer);
        }

        public void Unsubscribe(MailObserver observer)
        {
            observers.Remove(observer);
        }

        public void Receive(MailMessage mail)
        {
            NotifyMailReceived(mail);

            if (spamBlocker.ShouldBlock(mail))
            {
                NotifyMailRejected(mail);
                return;
            }

            DispatchMail(mail);
            NotifyMailStored(mail);
        }

        private void DispatchMail(MailMessage mail)
        {
            foreach (var address in mail.To)
            {
                var file = new FileInfo(Path.Combine(config.storeLocation, address.Address, $"{DateTime.Now.ToFileTimeUtc()}.eml"));
                file.Directory.Create();
                File.WriteAllText(file.FullName, mail.ToString()); // Sadly MailMessage has no simple way of converting to string
            }
        }

        private void NotifyMailReceived(MailMessage mail)
        {
            observers.ForEach(observer => observer.MailReceived(mail));
        }

        private void NotifyMailRejected(MailMessage mail)
        {
            observers.ForEach(observer => observer.MailRejected(mail));
        }

        private void NotifyMailStored(MailMessage mail)
        {
            observers.ForEach(observer => observer.MailStored(mail));
        }
    }
}
