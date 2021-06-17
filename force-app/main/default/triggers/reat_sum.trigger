trigger reat_sum on Contact (after insert,after update,before delete) 
{
set<id> accid = new set<id>();
list<account> accounttoupdate = new list<account>();
if(trigger.isinsert || trigger.isupdate)
{
    for(contact con:trigger.new)
    {
    accid.add(con.accountid);
    }
}
if(trigger.isdelete)
{
    for(contact con:trigger.old)
    {
    accid.add(con.accountid);
    }
}
map<id,account> accounts =new map<id,account>([select Id,sum__c from account where id in:accid]);
list<contact> contacts = new list<contact>([select Id,accountid,rate__c from contact where id in:accid]);
if(trigger.isinsert || trigger.isupdate)
{
    for(contact cons:trigger.new)
    {
    account acc = accounts.get(cons.accountid);
        //acc.sum__c = 0; 
        //if (contacts.size() > 0)
        //{
        //for(contact conlist:contacts)
        //{
        //    if(conlist.accountid == acc.id && conlist.rate__c != null)
        //    {   
        //    acc.sum__c = acc.sum__c + conlist.rate__c;
        //    } 
        //}
        //}
        if (trigger.isinsert && acc.sum__c != null)
        {
           acc.sum__c = acc.sum__c + cons.rate__c;  
        }
        else
        {
           acc.sum__c = cons.rate__c;
        }
        if (trigger.isupdate) 
        {  
           if(acc.sum__c != null && trigger.oldmap.get(cons.id).rate__c != null)
           {           
           acc.sum__c = acc.sum__c + cons.rate__c - trigger.oldmap.get(cons.id).rate__c;
           }
           else
           {           
           acc.sum__c = acc.sum__c+cons.rate__c;
           }                 
        }   
  
    accounttoupdate.add(acc);
    }
}
if(trigger.isdelete)
{
   for(contact cons:trigger.old)
   {
   account acc = accounts.get(cons.accountid);
   acc.sum__c = acc.sum__c - cons.rate__c; 
   accounttoupdate.add(acc);
   }
} 
update accounttoupdate;
}