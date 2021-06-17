public class listcontrol{
public string priorityid {get;set;}
List<Team_Task__C> task = new List<Team_Task__C>();
List<Team_Task__C> plist = new List<Team_Task__C>();


  public List<Team_Task__C> gettask()
    {
    if (priorityid == 'All'){
    task = [select Name,Team_Member__c,Priority__c,Date__c from Team_Task__C];
    return task;
    }
    else{
    task = [select Name,Team_Member__c,Priority__c,Date__c from Team_Task__C where Priority__c LIKE :priorityid];
    return task;
    }
    }
 }