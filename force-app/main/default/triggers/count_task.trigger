trigger count_task on Team_lead__c (after insert) 
{
set<id> leadId = new set<id>();
for(team_lead__c lead: trigger.new)
{

if(lead.a__c > 0)
{
leadid.add(lead.id);
}
}
map<id,list<team_task__c>> task = new map<id,list<team_task__C>>();
for(team_lead__c leads:trigger.new)
{
list<team_task__c> tasks = new list<team_task__c>();
//team_task__c newtask =task.get(leads.id);



}

}