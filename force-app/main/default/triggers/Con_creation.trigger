trigger Con_creation on Account (after insert) 
{
Decimal n;
integer i;
List<Contact> con = new list<Contact>();
for(Account acc:trigger.new)
{
 n = acc.Number_of_contacts__c;
 integer c =(integer)n;
system.debug ('Integer value: ' +c);
    if(c > 0)
    {
        for(i=0;i<c;i++)
        {
        COntact connew = new contact();
        connew.Firstname = acc.Name+'first'+i;
        system.debug ('contact value: ' +connew.firstname);
        connew.lastname = acc.name+'last'+i;
        connew.Phone = acc.Phone;
        con.add(connew);
        }
    }
}
system.debug ('contact valuesss: ' +con);
insert con;

}