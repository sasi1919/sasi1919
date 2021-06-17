public class batch0531 implements database.Batchable <sObject>
{
    public database.QueryLocator start(database.BatchableContext bc)
    { 
        string query = 'select Id,name from Teams__c';
        return database.getQueryLocator(query);
    }
    public void execute (database.BatchableContext bc, list<Teams__c> acclist)
    {
        for(Teams__c acc: acclist)
        {
            acc.name = acc.name + ' batch';
        }
        try 
        {
            update acclist;         
        } catch(Exception e) 
        {
            System.debug(e);
        }
    }
    public void finish(database.BatchableContext bc)
    {
        database.executeBatch(new batch05312());
    }
}