trigger con_count on Account (after insert,after update)
{
set<Id> accid = new set<Id>();
list<contact> contacts_to_add = new list<contact>();
    for(Account acc: trigger.new)
    {
    accid.add(acc.id);
    }
    map<id,integer> contactstoadd = new map<id,integer>();
    for(Account acct: [SELECT Id,(SELECT Id FROM Contacts) FROM Account WHERE Id IN :accid])
    {
    contactstoadd.put(acct.Id,acct.Contacts.size());
    }
    for(account accnt: trigger.new)
    {
    integer con_size = contactstoadd.get(accnt.id);
    system.debug('contacts size :' + con_size);
    system.debug('number of contacts to add :' + accnt.Number_of_contacts_to_add__c);
    if (accnt.Number_of_contacts_to_add__c > con_size) 
    {
        for(integer i =0; i < (accnt.Number_of_contacts_to_add__c - con_size) ;i++ )
        {
        contact con = new contact(firstname = accnt.name +'first' + i, lastname = accnt.name +'last' + i ,accountid = accnt.id );
        contacts_to_add.add(con);
        system.debug('contact rec :' +con );
        }
    }
    }
    insert contacts_to_add;

}