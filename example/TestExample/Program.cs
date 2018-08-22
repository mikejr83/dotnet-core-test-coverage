using System;
using TestExample.Lib;

namespace TestExample
{
    public class Program
    {
        public static void Main(string[] args)
        {
            if (args != null && args.Length > 0)
            {
                if (IntegerInvestigator.IsInteger(args[0]))
                {

                }
            }
            else
            {
                Console.WriteLine("You must supply at least one argument!");
            }
        }
    }
}
