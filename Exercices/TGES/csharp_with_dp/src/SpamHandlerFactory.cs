using System;
using System.Linq;

namespace TheGreatEmailServer
{
    public static class SpamHandlerFactory
    {
        public static SpamHandler Create(string name, dynamic config)
        {
            switch (name)
            {
                case "BadWords":
                    return new SpamHandlers.BadWords(config);

                case "RecipientWhitelist":
                    return new SpamHandlers.RecipientWhitelist(config);

                default:
                    throw new ArgumentException();
            }
        }
    }
}