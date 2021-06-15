using System;
using System.Net.Mail;
using System.IO;

using TheGreatEmailServer;

namespace Main
{
    public class StatsMailObserver : MailObserver
    {
        private string statsFilename;
        private int receivedCount;
        private int rejectedCount;

        public StatsMailObserver(string statsFilename)
        {
            this.statsFilename = statsFilename;
            receivedCount = 0;
            rejectedCount = 0;
        }

        public void MailReceived(MailMessage mail)
        {
            receivedCount++;
            UpdateStats();
        }

        public void MailRejected(MailMessage mail)
        {
            rejectedCount++;
            UpdateStats();
        }

        public void MailStored(MailMessage mail)
        {
        }

        private void UpdateStats()
        {
            using (StreamWriter file = new StreamWriter(statsFilename))
            {
                file.WriteLine($"Received count: {receivedCount}");
                file.WriteLine($"Rejected count: {rejectedCount}");
                file.WriteLine($"Spam ratio: {rejectedCount * 100 / receivedCount}%");
            }
        }
    }
}
