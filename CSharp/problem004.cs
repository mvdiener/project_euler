//A palindromic number reads the same both ways.The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

//Find the largest palindrome made from the product of two 3-digit numbers.

using System;
using System.Linq;

namespace Problem004
{
   class MainClass
   {
      public static void Main()
      {
         Console.WriteLine(GetPalindromes());
      }

      public static int GetPalindromes()
      {
         int product = 0;
         int largest = 0;
         for (int i = 999; i > 100; i--)
         {
            for (int j = 999; j > 100; j--)
            {
               product = i * j;
               if (product < largest) break;
               if (isPalindrome(product))
               {
                  if (product > largest) largest = product;
                  break;
               }
            }
         }
         return largest;
      }

      private static bool isPalindrome(int num)
      {
         return num.ToString() == new string(num.ToString().ToCharArray().Reverse().ToArray());
      }
   }
}
