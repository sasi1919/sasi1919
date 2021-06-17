@istest
public class AccountProcessorTest 
{
    @istest
    public static void contactcount()
    {
        Account acc = new Account(Name = 'test apex');
        insert acc;
        list<contact> conlist = new list<contact>();
        for(integer i=0;i<3;i++)
        {
        contact con = new contact();
        con.FirstName = 'testapex'+i;
        con.LastName = 'testing'+i;
        con.AccountId = acc.id;
        conlist.add(con);
        }
        insert conlist;
        list<Id> setAccId = new list<ID>();
        setAccId.add(acc.id);
        Test.startTest();
           AccountProcessor.countContacts(setAccId);
        Test.stopTest();
        Account accnew =[select id,Number_of_Contacts__c from account where id=:acc.Id];
        system.debug('Number of contacts: '+accnew.Number_of_Contacts__c );
        system.assertEquals(accnew.Number_of_Contacts__c, 3);
    }
}