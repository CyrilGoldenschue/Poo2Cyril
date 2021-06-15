using System;
using System.Threading;

using TheGreatEmailServer;

namespace Main
{
    class Program
    {
        static void Main(string[] args)
        {
            var exitEvent = new ManualResetEvent(false);
            Console.CancelKeyPress += (sender, eventArgs) => {
                                        eventArgs.Cancel = true;
                                        exitEvent.Set();
                                    };

            var mailServerConfig = new MailServer.Config {
                    storeLocation = "data",
                    spamHandlers = {("BadWords", "bad_words_list.txt"), ("RecipientWhitelist", "@(cpnv.ch|vd.ch)$")} 
                };
            var smtpServerPort = 3325;

            MailServer mailServer = new MailServer(mailServerConfig);
            mailServer.Subscribe(new LoggerMailObserver());
            mailServer.Subscribe(new StatsMailObserver("data/stats.txt"));

            SmtpConnector smtpConnector = new SmtpConnector(smtpServerPort, mailServer);
            smtpConnector.Run();

            exitEvent.WaitOne();
            smtpConnector.Stop();
        }
    }
}
