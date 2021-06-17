public class objectList{

public Team_task__c acc {get;set;}
public pagereference searchdata()
{

//you can fetch dummy lookup field vale here and process accordingly.
 System.debug('@@@@@@@@@@@'+acc.ownerid);
 return null;
}
 
  public objectList()
  {

 // instantiate your dummy object

    acc = new Team_task__c ();
  }
  }