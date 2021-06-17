public class account_trigger_helper 
{
    public void accountupdate(list<Account> accountdetails,Map<Id,Account> newaccountdetails,Map<Id,Account> oldaccountdetails)
    {
         set<Id> accountid = new set<Id>();
         for (Account accnew: accountdetails)
         {
             Account accold = oldaccountdetails.get(accnew.Id);
              if (accnew.Phone != accold.Phone)         
              {
                accountid.add(accnew.Id);
              }      
         }
        if (accountid.isEmpty() == false)
        {
            List<Contact> Contactlist = [select Id,AccountId from contact where AccountId in:accountid]; 
            for(Contact connew: Contactlist)
                {
                 Account acc = new Account();
                 acc= newaccountdetails.get(connew.AccountId);
                 connew.Phone = acc.Phone;
                }
            Update Contactlist;
         }     
    }

}