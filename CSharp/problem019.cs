//You are given the following information, but you may prefer to do some research for yourself.

//1 Jan 1900 was a Monday.
//Thirty days has September,
//April, June and November.
//All the rest have thirty-one,
//Saving February alone,
//Which has twenty-eight, rain or shine.
//And on leap years, twenty-nine.
//A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
//How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

using System;
using System.Collections.Generic;

namespace Problem019
{
   class MainClass
   {
      public static void Main()
      {
         Console.WriteLine(FindAllFirstSundays());
      }

      private static int FindAllFirstSundays()
      {
         int startingDay = 2;
         int firstSundayCount = 0;
         Dictionary<string, int> sundayObject = new Dictionary<string, int>();
         for (int year = 1901; year <= 2000; year++)
         {
            sundayObject = FindFirstSundaysInYear(startingDay, year);
            firstSundayCount += sundayObject["FirstSundayCount"];
            startingDay = sundayObject["StartingDay"];
         }

         return firstSundayCount;
      }

      public static Dictionary<string, int> FindFirstSundaysInYear(int startingDay, int year)
      {
         bool isLeapYear = IsLeapYear(year);
         List<int> daysInMonths = new List<int>(new int[] { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31});
         int firstSundayCount = 0;

         foreach (var month in daysInMonths)
         {
            if (isLeapYear && month == 28)
            {
               startingDay = (startingDay + 29) % 7;
            }
            else
            {
               startingDay = (startingDay + month) % 7;
            }
            if (startingDay == 0) firstSundayCount += 1;
         }

         Dictionary<string, int> sundayObject = new Dictionary<string, int>();
         sundayObject["FirstSundayCount"] = firstSundayCount;
         sundayObject["StartingDay"] = startingDay;

         return sundayObject;
      }

      public static bool IsLeapYear(int year)
      {
         if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0))
         {
            return true;
         }
         else
         {
            return false;
         }
      }

   }
}
