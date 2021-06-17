@isTest 
public class TestRestrictContactByName
{
    //List<Contact> con = new List<Contact>([select Id,Name from contact]);
    @istest
    public static void contactadd()
    {
        test.startTest();
    contact con1 = new contact();
    con1.firstname = 'error';
    con1.LastName = 'invalidname';
        try{
    	insert con1;
        }
        catch (exception e){
            test.stopTest();
        }
    contact con2 = [select Id, Lastname from contact where id = :con1.id];
    System.assertEquals(con2.LastName,'INVALIDNAME');
    }  
}