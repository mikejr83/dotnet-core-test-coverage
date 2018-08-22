using System.Linq;

namespace TestExample.Lib
{
    public class CharacterCounter
    {
        public static int CountUniqueCharacters(string input, bool ignoreCase = false)
        {
            if(!ignoreCase)
            {
                return input.ToCharArray().Distinct().Count();
            }
            else
            {
                return input.ToUpperInvariant().ToCharArray().Distinct().Count();
            }
        }
    }
}
