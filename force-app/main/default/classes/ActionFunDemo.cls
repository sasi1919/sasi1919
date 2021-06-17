public class ActionFunDemo{

  public ActionFunDemo(){
        acc= new Account();
        showtxt = false;
    }   

    public Boolean showtxt { get; set; }
    public Account acc{get;set;}  

    public PageReference statusChanged() {
        if(acc.Active__c == 'Yes'){
            showtxt = true;
        }
        else{
            showtxt = false;
        }
        return null;
    }  
}