trigger acc_con on Account (after insert,after update) 
{
        set<id> accid = new set<id>();
        Set<id> duplicateconid=  new Set<id>();
        list<contact> conlist = new list<contact>();
        for(Account acc: trigger.new)
        {
            accid.add(acc.id);
        }
        list<contact> duplicatecontacts = [select Id,AccountId,Name from contact where accountid in :accid];
        for(contact con: duplicatecontacts )
        {
            duplicateconid.add(con.accountid);
        }
        for(Account acc: trigger.new)
            {
            if(duplicateconid.contains(acc.id))
            {
            acc.adderror('Contact Record already exist with same account Id');
            }
            else
            {
            contact con = new contact();
            con.lastname = acc.name;
            con.accountid = acc.id;
            conlist.add(con);
            }
        }
        insert conlist;
}