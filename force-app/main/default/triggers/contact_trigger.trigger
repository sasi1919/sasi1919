trigger contact_trigger on Contact (before insert) {
    set<Id> accntid = new set<Id>();
    for (Contact con: Trigger.New)
    {
         if(con.name<>' ')
         {
         accntid.add(con.AccountId);
         }
    }
    Map<Id,Account> accountdetails = new Map<Id,Account>([select Phone from Account where Id in :accntid ]);
    for (Contact con: Trigger.New)
    {
    Account acc = new Account();
    acc = accountdetails.get(con.AccountId);
         if(acc.Phone<>' ')
         {
         con.Phone = acc.Phone;
         }
    }    
    
    
}