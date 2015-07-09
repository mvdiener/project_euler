// If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

// Find the sum of all the multiples of 3 or 5 below 1000.

using System;
using System.Linq;

namespace Problem001
{
  class MainClass
  {
    public static void Main()
    {
      Console.WriteLine(SumOfMultiples(1000));
    }

    public static int SumOfMultiples(int endRange)
    {
      int sum;
      sum = Enumerable.Range(1, endRange - 1).Where(x => x%3 == 0 || x%5 == 0).Sum();
      return sum;
    }
  }
}