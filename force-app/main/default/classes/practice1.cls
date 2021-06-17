public class practice1
{
public Team_task__c task = new Team_task__c ();
public void settask(Team_task__c  newtask)
{
this.task = newtask;
}
public Team_task__c  gettask()
{
system.debug('task details in get method:' + task);
return task;
}

//list<Team_task__c> tasklist= new list<Team_task__c>();
Id taskid = ApexPages.currentPage().getParameters().get('id');

//list<Team_task__c> tasklist= new list<Team_task__c>([SELECT Name FROM Team_task__c WHERE name = :task.name]) ;
    public team_task__c teamdetails()
    {
    if(taskid != null)
    {
        Team_task__c task = [select Name,team_member__c,Priority__c,Member_email__c  from Team_task__c where id=:taskid ];
    }    
        try 
        { 
        system.debug('task details:' + task);
        upsert task;
        }
        catch(System.DMLException e) 
        {
        ApexPages.addMessages(e);
        return null;
        }
        return task;
    } 
   public pagereference save()
    {
    return null;
    }
    
}