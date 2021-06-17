public class NewAndExistingController {
    public Team_task__c Teamtask{ get; private set; }
    public NewAndExistingController()
    {
    ID id = ApexPages.currentPage().getParameters().get('id');
    system.debug('Id value : ' + id);
    teamtask = (id == null) ? new Team_task__C() :
    [SELECT Name, Team_member__c, Priority__c FROM Team_task__C WHERE Id = :id];
    }
    public PageReference save() 
    {
    try 
        {
        upsert teamtask ;
        }
        catch(System.DMLException e) 
        {
        ApexPages.addMessages(e);
        return null;
        }
        // After successful Save, navigate to the default view page
     //PageReference redirectSuccess = new ApexPages.StandardController(Account).view();
     return null;
    }
}