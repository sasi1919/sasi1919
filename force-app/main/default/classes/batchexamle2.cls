public class batchexamle2 implements Database.Batchable <sobject>
{
    public string stateval;
    public list<Team_task__c> tasks = new list<team_task__C>();
    public batchexamle2(string state)
    {
       this.stateval=state; 
    }
    public database.QueryLocator start(database.BatchableContext task)
    {
        string query = 'select Id,state__c from Team_member__c where state__c = :stateval';
        return Database.getQueryLocator(query); 
    }
    public void execute(database.BatchableContext task, List<Team_Member__c> teams)
    {
        system.debug('Team list :' +teams);
        for(Team_member__c team: teams)
        {
            for(team_task__c tasklist:[select Id,State__c from Team_task__c where team_member__c=:team.Id])
            {
                system.debug('Tasklist:' + tasklist);
                tasklist.State__c = team.State__c;
                tasks.add(tasklist);
            }
        }
        if(tasks.size()>0)
        {
        	update tasks;
        }
                
    }
    public void finish(database.BatchableContext task)
    {
        system.debug('completed');
    }

}