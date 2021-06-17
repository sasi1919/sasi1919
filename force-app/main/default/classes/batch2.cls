public class batch2 implements Database.Batchable<sobject>
{
    public Database.QueryLocator start(database.BatchableContext sasi)
    {
        string query = 'select Id,name from Team_task__c';
        return database.getQueryLocator(query);
    }
    public void execute(database.BatchableContext sasi,List<Team_task__c> teamtask)
    {
        system.debug('task details: ' +teamtask);
        for(Team_Task__c tasknew:teamtask)
        {
        system.debug('Task name: ' + tasknew.name);    
        tasknew.name= tasknew.name+' batch2';
        system.debug('Task name after change: ' + tasknew.name);    
        }
        update teamtask;
    }
     public void finish(database.BatchableContext sasi)
    {
        //system.debug('Completed');
    }
}