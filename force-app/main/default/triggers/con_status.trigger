trigger con_status on Account (before update)
{
set<Id> accid = new set<Id>();
list<contact> contacts_to_add = new list<contact>();
    for(Account acc: trigger.new)
    {
        accid.add(acc.id);
    }
    map<id,list<contact>> contactslist = new map<id,list<contact>>();
    list <account> accntlist = [SELECT Id,(SELECT Id,Status_test__c  FROM Contacts) FROM Account WHERE Id IN :accid];
    for(Account acct: accntlist)
    {
        contactslist.put(acct.Id,acct.contacts);
    }
    for(account accnt: trigger.new)
    {
        list<contact> conlist = contactslist.get(accnt.id);
        integer i =0;
        for(contact con:conlist)
        {
            if(con.Status_test__c == 'Yes')
            {
                i++;
            }
        }
    if (conlist.size() == i)
    {
        accnt.Stats_test__c = 'Yes';
    } 
    else
    {
        accnt.Stats_test__c = 'No';
    }
    }
}