trigger count_contact on Account (after insert,after update) 
{
    set<id> accId = new set<id>();
    for(Account acc: trigger.new)
    {   
        if(acc.sum__c> 0)
        {
        accid.add(acc.id);
        }
    }
    list<contact> totalcons= new list<contact>([select Id,accountid from contact where accountid in :accid]);
    list<contact> insertcontacts = new list<contact>();
    integer n;
    for(account accs:trigger.new)
    {
      integer n = 0;
      for(contact con: totalcons)
      {
      if(con.accountid == accs.id)
      {
          n++;
      }
      }
      system.debug('Contacts to be added:'+accs.sum__c);
      system.debug('Contacts fetched:'+n);
      if (accs.sum__c > n) 
      {
         for(integer i=0;i<(accs.sum__c-n);i++)
         {
         contact connew = new contact(Accountid=accs.id,Firstname='sasifirst'+i,LastName='sasilast'+i) ;
         insertcontacts.add(connew);
         } 
      }   
    }
    insert insertcontacts;    
}