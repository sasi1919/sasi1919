trigger ClosedOpportunityTrigger on Opportunity (after insert,after update)
{
    set<Id> oppid =new set<Id>();
    List<task> tasks = new List<task>();
    for(Opportunity opp:Trigger.New)
    {
        if (opp.StageName == 'Closed Won')
            {
            Task taskopp = new Task();
            //taskopp.AccountId= opp.Id;
            taskopp.subject =  'Follow Up Test Task';
            tasks.add(taskopp);            
            }
    }

    insert tasks;    
}