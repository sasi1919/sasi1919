trigger acc_trigger on Account (before update)
{
set<Id> Accid = new set<Id>();
for (Account acc:Trigger.new)
{
List<contact> con=[select Name from contact where accountId = :acc.id];
acc.Number_of_contacts__c = con.size();

}



}