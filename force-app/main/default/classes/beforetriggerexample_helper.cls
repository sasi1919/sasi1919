public class beforetriggerexample_helper 
{
    public static void updatecotact(list<Account> acclist,map<id,Account> newaccmap,map<id,Account> oldaccmap)
    {
    list<contact> conlist = new list<contact>();
   /* set<id> setaccid = new set<id>();
	for(Account acc:acclist)
    {
         setaccid.add(acc.id);      
    } */
    
    conlist = [select id,AccountId,New_Phone_Number__c,Old_Phone_Number__c from contact where AccountId in :trigger.newMap.Keyset()]; 
    for(Contact con:conlist)
    {
        Account newacc = newaccmap.get(con.AccountId);
        Account oldacc = oldaccmap.get(con.AccountId);
        con.New_Phone_Number__c = newacc.Phone;
        con.Old_Phone_Number__c = oldacc.Phone;
    }
    update conlist;        
    }
    public static void deleteopps(list<Account> acclist)
    {
    list<Opportunity> opplist = new list<Opportunity>();
    set<id> setaccid = new set<id>();
	for(Account acc:acclist)
    {
         setaccid.add(acc.id);      
    }     
    opplist = [select id,AccountId from opportunity where AccountId in :setaccid]; 
    delete opplist;        
    }    

}