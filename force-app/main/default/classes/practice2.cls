public class practice2
{
public string name;
public practice2()
{

}
public List<Team_Task__c> getteamdetails()
{
list<team_task__c> task= [select Name,Team_member__c,Priority__c,Member_email__c from Team_task__c];
return task;
}



}