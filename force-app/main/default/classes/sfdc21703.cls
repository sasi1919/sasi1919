public class sfdc21703{

public string priorityid;
string message;
integer count;
public List<Team_Task__C> task = new List<Team_Task__C>();

    public void setpriorityid(string p){
      this.priorityid = p;
      priorityid =  priorityid.replace('*','');
    }
    public string getpriorityid(){
       return priorityid;
    }

    public List<Team_Task__c> getplist(){
    try{
    if ((priorityid == 'All') || (priorityid == null))  {
    task = [select Name,Team_Member__c,Priority__c,Date__c from Team_Task__C order by Name ];
    //count= database.countQuery('select count() from Team_Task__C');
    return task;
    }
    else{
    task = [select Name,Team_Member__c,Priority__c,Date__c from Team_Task__c where Priority__c LIKE :('%'+priorityid+'%') order by Name];
    //count= database.countQuery('select count() from Team_Task__C where Priority__c like :('%'priorityid''%)');
    return task;
    }  
    }
    catch(DmlException e){
      System.debug('The following exception has occurred: ' + e.getMessage());
      ApexPages.addMessages(e);
      return null;
    }    
    }
    //public string getmessage()
    //{
    //if (count == 0){
    //  message = count +' results found';
    //}
    //else
    //{
    //  message = 'No results found';
    //}
    //return message;
    //}
        
    public pagereference task1(){  
    return null;  
    }
 }