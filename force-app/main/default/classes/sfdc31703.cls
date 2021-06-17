public class sfdc31703{

public Team_Task__C team =new team_task__c();

string p;
list<team_task__c> task = new list<team_task__c>();
public sfdc31703()
{
task = [select Name,Team_Member__c,Priority__c,Date__c from Team_Task__c order by Name];
}
public void setteam(team_task__c team1)
{
this.team=team1;

}
public team_task__c getteam()
{
return team;

}
    public List<Team_Task__c> getplist(){
    if (team.priority__c!= null)
    {
    task = [select Name,Team_Member__c,Priority__c,Date__c from Team_Task__c where Priority__c LIKE :team.priority__c order by Name];
    //count= database.countQuery('select count() from Team_Task__C where Priority__c like :('%'priorityid''%)');
    return task;  
    }
        else
    {
    task = [select Name,Team_Member__c,Priority__c,Date__c from Team_Task__c order by Name];
    //count= database.countQuery('select count() from Team_Task__C where Priority__c like :('%'priorityid''%)');
    return task;  
    }     
    }
        
    public pagereference tasklist(){  
    return null;  
    }
 }