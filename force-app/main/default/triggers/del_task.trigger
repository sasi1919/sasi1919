trigger del_task on team_member__c(before delete)
{

    list<Team_Task__c> teamtask = new list<Team_Task__c>();
    //list<Team_task__c> tasks = new list<team_task__c>();
    for(Team_member__c members: trigger.old)
    {
      list<Team_task__c> tasks = [select Id,Name from team_task__c where team_member__C = :members.id];
      teamtask.addall(tasks);
    
    }
    delete teamtask ;


}