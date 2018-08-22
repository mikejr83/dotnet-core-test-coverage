using System;
using Xunit;

namespace TestExample.Tests
{
    public class ProgramTests
    {
        [Fact]
        public void Main_Test()
        {
            // Assert that the program doesn't fail with an empty array passed in
            Program.Main(new string[] { });
        }

        [Fact]
        public void Main_NullArgs_Test()
        {
            // Assert that the program doesn't fail with no args
            Program.Main(null);
        }
    }
}
