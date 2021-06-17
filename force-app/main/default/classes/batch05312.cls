public class batch05312 implements database.Batchable <sobject>
{
	public database.QueryLocator start(database.BatchableContext bc)
    {
        string query = 'select Id,name from teams__c';
        return database.getQueryLocator(query);
    }
    public void execute(database.BatchableContext bc, list<teams__c> listteam)
    {
        for(teams__c team: listteam)
        {
            team.name = team.name.replace('batch','sasi');
        }
        update listteam;
    }
    public void finish(database.BatchableContext bc)
    {
        
    }

}