//The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

//Find the sum of all the primes below two million.

using System;
using System.Collections.Generic;
using System.Linq;

namespace Problem010
{
   class MainClass
   {
      public static void Main()
      {
         List<int> primes = FindPrimesInRange(2000000);
         Console.WriteLine(SumOfList(primes));
      }

      public static List<int> FindPrimesInRange(int num)
      {
         int val;
         List<int> allNumbers = Enumerable.Range(2, num-1).ToList();
         int count = allNumbers.Count() - 1;

         for (int i = 0; i < count; i++)
         {
            if (allNumbers[i] != 0)
            {
               val = allNumbers[i];
               while (i + val <= count)
               {
                  allNumbers[i + val] = 0;
                  val += allNumbers[i];
               }
            }
         }

         return allNumbers;
      }

      public static long SumOfList(List<int> list)
      {
         return list.Sum(x => (long)x);
      }
   }
}
