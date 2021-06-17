trigger team1_trigger on Teams__c (before delete) 
{
//set<Id> teamid = new set<Id>();
boolean status = Trigger_Status__c.getinstance('account_trigger1').status__c;

List<Team_Lead__c> teamlead1 = new list<Team_Lead__C>();
    for (Teams__c t:Trigger.old)
    {
    List<Team_Lead__c> teamlead = new list<Team_Lead__C>([select Id from Team_Lead__c where team__c = :t.id]);
        for(Team_Lead__c lead:teamlead )
        {
        teamlead1.add(lead);
        }
    }
    
    delete teamlead1; 
}