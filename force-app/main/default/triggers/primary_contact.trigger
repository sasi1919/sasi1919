trigger primary_contact on contact(before insert) 
{
list<contact> contacts = new list<contact>();
    for(contact con: trigger.new)
    {
    list<Contact> conlist = [select Id from Contact where AccountId = :con.Accountid];
        if (conlist.size() > 0)
        {
        con.adderror('Primary contact is already present');
        }
    }
}