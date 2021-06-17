public class teamtask{
List<Team_Task__c> task = [select Name,Team_Member__c,Priority__c,Member_email__c from Team_Task__c];
public List<Team_Task__c>  gettt(){
return task;
}
}