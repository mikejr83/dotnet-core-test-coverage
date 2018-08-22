using System;
using Xunit;

namespace TestExample.Lib.Tests
{
    public class CharacterCounterTests
    {
        [Fact]
        public void CountUniqueCharacters_Test()
        {
            string testString = "TEST_string";
            int numberOfUniqueCharacters = 10;

            var result = CharacterCounter.CountUniqueCharacters(testString);

            Assert.Equal(numberOfUniqueCharacters, result);
        }
    }
}
