trigger soqlandDml on Account (after insert) 
{
list<contact> con = new list<contact>();
    for(Account a: trigger.new)
    {
        for(integer i=0;i<5;i++)
        {
        contact c = new contact();
        c.lastname = a.name+i;
        c.accountid= a.id;
        con.add(c);
        }
    }
insert con;
}