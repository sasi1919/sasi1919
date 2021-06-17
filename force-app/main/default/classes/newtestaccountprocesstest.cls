@istest
public class newtestaccountprocesstest 
{    

    @istest
    public static void add()
    {
        Account acc = new Account();  
		list<contact> con = new list<contact>();
     acc.name='testpurpose1';
     insert acc;
     for(integer i=0;i<2;i++)
     {
        contact connew = new contact();
         connew.FirstName=acc.name+i;
         connew.LastName=acc.name+'last'+i;
         connew.AccountId=acc.id;
         con.add(connew);  
     }
        insert con;
        
        //test.startTest();
        Account accnew =[select id,Number_of_Contacts__c from account where id=:acc.Id];
        //test.stopTest();
        system.assertEquals(2, accnew.Number_of_Contacts__c);
    }
}