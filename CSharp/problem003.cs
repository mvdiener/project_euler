//The prime factors of 13195 are 5, 7, 13 and 29.

//What is the largest prime factor of the number 600851475143 ?

using System;
using System.Collections.Generic;
using System.Linq;

namespace Problem003
{
   class MainClass
   {
      public static void Main()
      {
         List<long> factorArray = new List<long>();
         Console.WriteLine(PrimeFactors(600851475143, factorArray));
      }

      public static long PrimeFactors(long number, List<long> factorArray)
      {
         for (long i = 2; i <= number; i++)
         {
            if (number % i == 0) {
               factorArray.Add(i);
               number = number / i;
               PrimeFactors(number, factorArray);
               break;
            }
         }
         factorArray.Sort();
         return factorArray.Last();
      }
   }
}
