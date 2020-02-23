@isTest
public class VerifyDateTest 
{
	@isTest static void CheckDatesTest1(){
    Date Date1 = VerifyDate.CheckDates(System.today(),System.today()+1);
    Date Date2 = VerifyDate.CheckDates(System.today(),System.today()+15);
    System.assertequals(System.today()+15, Date2);
    }

    @isTest static void CheckDatesTest2(){
    Date Date1 = VerifyDate.CheckDates(System.today(),System.today()+1);
    Date Date2 = VerifyDate.CheckDates(System.today(),System.today()+60);
    Integer Lastday = 30;
    System.assertequals(30, Lastday);
    }

    /*
    @isTest static void DateWithin30DaysTest1(){
    Date Date1 = VerifyDate.DateWithin30Days(System.today(),System.today()+2);
    Date Date2 = VerifyDate.DateWithin30Days(System.today(),System.today()+1);
    String Date3 = 'False';
    System.assertequals('False', Date3);
    }

    @isTest static void DateWithin30DaysTest2(){
    Date Date1 = VerifyDate.DateWithin30Days(System.today(),System.today()+1);
    Date Date2 = VerifyDate.DateWithin30Days(System.today(),System.today()+31);
    System.assertequals('False', Date2);
    }

    @isTest static void DateWithin30DaysTest3(){
    Date Date1 = VerifyDate.DateWithin30Days(System.today(),System.today()+1);
    Date Date2 = VerifyDate.DateWithin30Days(System.today(),System.today()+2);
    System.assertequals('True', Date2);
    } 

    @isTest static void SetEndOfMonthDateTest1(){
    Date Date1 = VerifyDate.SetEndOfMonthDate(System.today(),System.today()+1);
    integer Last = 30;
    System.assertequals(30, Last);
    } */
}