public class samplebatch1 implements database.Batchable<sobject> 
{
    public database.QueryLocator start(database.BatchableContext bc)
    {
        return null;
    }
    public void execute(database.BatchableContext bc,list<contact> con)
    {
        
    }
    public void finish(database.BatchableContext bc)
    {
        
    }

}