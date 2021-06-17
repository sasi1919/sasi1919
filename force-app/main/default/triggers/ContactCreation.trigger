trigger ContactCreation on Account (after insert) 
{
    list<contact> conlist = new list<contact>();
    for(Account a:trigger.new)
    {
        contact c = new contact();
        c.LastName = a.Name;
        c.FirstName = 'Test';
        c.AccountId = a.Id;
        conlist.add(c);
    }
    insert conlist;
}