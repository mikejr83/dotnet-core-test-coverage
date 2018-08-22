using System;
using System.Collections.Generic;
using System.Text;
using Xunit;

namespace TestExample.Lib.Tests
{
    public class IntegerInvestigatorTests
    {
        [Fact]
        public void IsInteger_NullArg_Test()
        {
            var result = IntegerInvestigator.IsInteger(null);

            Assert.False(result);
        }
    }
}
