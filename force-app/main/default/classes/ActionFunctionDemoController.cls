public with sharing class ActionFunctionDemoController {
    
    public teams__c team = new teams__c();
    public void setteam(teams__c team1)
    {
      this.team = team1;
    }
    public teams__c getteam()
    {
       return team;
    }
    public String message {get;set;}
    
    public ActionFunctionDemoController() {
        team= new teams__c(name='Some Value');
        //message = 'Try again!!'; // initial message.
    }
    
  public PageReference save() { 
    try {
        insert team;
        message = 'Insert successful! -- ' + team.id;
        system.debug('message :' +message);
    } catch (Exception e) {
      ApexPages.addMessages(e);
      message = 'Whoops! An error occurred -- ' + e.getMessage();      
    }
    return null;
  }

}