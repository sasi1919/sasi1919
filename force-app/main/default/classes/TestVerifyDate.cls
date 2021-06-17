@isTest
public class TestVerifyDate
{
    @isTest static void CheckDatestesttrue() 
    {
        Date date1 = date.today();
        Date date2 = date1.addDays(29);
        Date datein = VerifyDate.CheckDates(date1,date2);
        System.assertEquals(datein,date2);
    }
    @isTest static void CheckDatestestfalse() 
    {
        Date date1 = date.today();
        Date date2 = date.today();
        Date datein = VerifyDate.CheckDates(date1,date2);
        System.assertEquals(datein,date1);
    }
        @isTest static void Dateover() 
    {
        Date date1 = date.today();
        Date date2 = date1.addDays(31);
        Date datein = VerifyDate.CheckDates(date1,date2);
        System.assertNotEquals(datein,date1);
    }
}