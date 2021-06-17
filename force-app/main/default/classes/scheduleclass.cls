public class scheduleclass implements schedulable
{
	public void execute(SchedulableContext  sc)
    {
        list<Teams__c> teams = [select Id,Name from Teams__c];
        for(Teams__c t: teams)
        {
            t.name = t.name + 'sasi';
        }
        update teams;
    }
}