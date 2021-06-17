trigger Creating_contact_rec_n on Account (after insert)
{
Decimal n;
Decimal i;
list<contact> con = new list<contact>();
    for(Account acc: Trigger.new)
    {
    n = acc.Number_of_contacts_to_add__c;
    Integer c= (Integer)n;
    system.debug('number of contacts to be add: ' + n); 
    if (c>0)
    {   
        for(i=1;i< = c;i++)
        {
          Contact connew = new contact();
          //connew.FirstName = acc.name+'sasi' + i;
          connew.LastName = acc.name + i;
          connew.AccountId = acc.id;
          system.debug('new contact record: ' + connew);
          con.add(connew);
        }
    }
    }
insert con;

}