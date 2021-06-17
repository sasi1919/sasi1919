public class demotrigger1handler 
{
    public static void error(list<contact> contlist)
    {
        set<id> accid = new set<id>();
        for(contact con:contlist)
        {
            accid.add(con.AccountId);
        }
        map<id,integer> consize = new map<id,integer>();
        
        for(account acc:[select id, (select id from contacts) from account where id in :accid])
        {            
			consize.put(acc.id, acc.contacts.size());                        
        }
        for(contact con:contlist)
        {
           integer size = consize.get(con.AccountId); 
           if(size >= 2)
           {
               con.adderror('Only 2 contacts can have the same account');
           }
        }        
    }

}