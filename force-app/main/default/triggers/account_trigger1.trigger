trigger account_trigger1 on Account (after update) 
{
if(Trigger_check__c.getinstance().status__c)
{
set<id> accid = new set<id>();
    for(account acc:trigger.new)
    {
        if (acc.phone != trigger.oldmap.get(acc.Id).Phone)
        {
        accid.add(acc.id);
        }
    }
List<Contact> condetails = new List<Contact>([select Phone,AccountId from contact where AccountId in :accid]);
List<Contact> newcontact = new list<Contact>();
if(condetails.size() > 0)
{
    for(Contact accn: condetails )
    {
   
    accn.Phone = Trigger.newmap.get(accn.AccountId).Phone;
    }
    update condetails ;
 }
 }
}