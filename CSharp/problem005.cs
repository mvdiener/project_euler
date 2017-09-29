//2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

//What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

using System;
using System.Collections.Generic;

namespace Problem005
{
   class MainClass
   {
      public static void Main()
      {
         Console.WriteLine(FindLowestCommonMultiple(20));
      }

      public static int FindLowestCommonMultiple(int num)
      {
         Dictionary<int, int> allFactors = new Dictionary<int, int>();
         for (int i = 2; i <= num; i++)
         {
            Dictionary<int, int> singleNumberFactors = new Dictionary<int, int>();
            singleNumberFactors = PrimeFactors(i, singleNumberFactors);
            allFactors = GroupFactors(allFactors, singleNumberFactors);
         }

         int total = 1;
         foreach (var factor in allFactors)
         {
            total *= (int)(Math.Pow((double)factor.Key, (double)factor.Value));
         }

         return total;
      }

      public static Dictionary<int, int> GroupFactors(Dictionary<int, int> allFactors, Dictionary<int, int> singleNumberFactors)
      {
         foreach (var factor in singleNumberFactors)
         {
            if (allFactors.ContainsKey(factor.Key))
            {
               if (allFactors[factor.Key] < factor.Value)
               {
                  allFactors[factor.Key] = factor.Value;
               }
            }
            else
            {
               allFactors[factor.Key] = factor.Value;
            }
         }

         return allFactors;
      }

      public static Dictionary<int, int> PrimeFactors(int number, Dictionary<int, int> factorGrouping)
      {
         for (int i = 2; i <= number; i++)
         {
            if (number % i == 0)
            {
               if (factorGrouping.ContainsKey(i))
               {
                  factorGrouping[i] += 1;
               }
               else
               {
                  factorGrouping[i] = 1;
               }
               number = number / i;
               PrimeFactors(number, factorGrouping);
               break;
            }
         }
         return factorGrouping;
      }

   }
}
