trigger team_task_trigger1 on Teams__c (after insert) 
{
List<Team_task__c> teamtask = new List<Team_task__c>();
for(Teams__c team:trigger.new)
{
Team_task__c task = new Team_task__c(name=team.name);
teamtask.add(task);
}
insert teamtask;

}