public class AccountProcessor 
{
    @TestVisible
    private static void countContacts(List<id> accountid)
    {
        list<contact> con =  new list<contact>();
        list<Account> acclist = new list<Account>();
        for(Id a:accountid)
        { 
            con = [select Id from contact where AccountId = :a];
            system.debug('Number of contacts: ' + con.size());
            Account accnew = [select Name,Number_of_Contacts__c from Account where Id = :a];
            accnew.Number_of_contacts__c = con.size();
            system.debug('Account details: ' + accnew);
            acclist.add(accnew);
        }
            update acclist;
    }
}