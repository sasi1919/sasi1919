public class batchclass implements Database.Batchable<sObject>
{
	public  database.QueryLocator start(database.BatchableContext sasi)
	{
      string query = 'select Id,Name from Teams__c';
      return database.getquerylocator(query);
	}
    public void execute(database.BatchableContext sasi , list<Teams__c> teamlist)
	{
    	for (Teams__c t:teamlist)
        {
            t.name = t.name + 'test';
        }
        update teamlist;
	}
    public void finish(database.BatchableContext sasi)
	{
    system.debug('finish');
	}
}