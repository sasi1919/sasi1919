trigger accont_contact_phone on Account (after update) 
{
    set<Id>accid= new set<Id>();
    for(account acc:trigger.new)
    {
    if (acc.phone != trigger.oldmap.get(acc.id).phone)
    {
    accid.add(acc.id);
    }
    }
    list<contact> conlist =new list<contact>([select Id,Accountid,Phone from contact where Accountid in :accid]);
    for(Contact connew: conlist)
    {
    //account accnew = ([select Phone from Account where id=:connew.accountid]);
    connew.phone = trigger.newmap.get(connew.accountid).phone; 
    }
    update conlist;
}