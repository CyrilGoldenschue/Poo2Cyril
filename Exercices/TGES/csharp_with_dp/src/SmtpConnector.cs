using System;
using System.Net.Mail;
using netDumbster.smtp;

namespace TheGreatEmailServer
{
    public class SmtpConnector
    {
        private int port;
        private MailServer mailServer;
        private SimpleSmtpServer smtpServer;

        public SmtpConnector(int port, MailServer mailServer)
        {
            this.port = port;
            this.mailServer = mailServer;
        }

        public void Run()
        {
            smtpServer = SimpleSmtpServer.Start(port);
            smtpServer.MessageReceived += (sender, args) =>
            {
                var rawMessage = args.Message.Data.TrimEnd('\r', '\n');
                MailMessage mailMessage = MailMessageMimeParser.ParseMessage(rawMessage);

                mailServer.Receive(mailMessage);
            };
        }

        public void Stop()
        {
            smtpServer.Stop();
        }
    }
}
