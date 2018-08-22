using System;
using System.Collections.Generic;
using System.Text;

namespace TestExample.Lib
{
    public class IntegerInvestigator
    {
        public static bool IsInteger(object input)
        {
            if (input == null) return false;
            if (input is Int32) return true;

            int result = 0;

            return int.TryParse(input.ToString(), out result);
        }
    }
}
