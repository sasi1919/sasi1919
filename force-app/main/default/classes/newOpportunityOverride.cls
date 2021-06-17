/*
    Created by: Greg Hacic
    Last Update: 9 February 2016 by Greg Hacic
    Questions?: greg@interactiveties.com
    
    NOTES:
        - extension for newOpportunityOverride.page
        - built in order to pre-populate a Name, Stage & Close Date values on new Opportunity records
        - tests located at newOpportunityOverrideTest.class
*/
public class newOpportunityOverride {
    
    private final Opportunity o; //Opportunity object
    
    //constructor
    public newOpportunityOverride(ApexPages.StandardController standardPageController) {
        o = (Opportunity)standardPageController.getRecord(); //instantiate the standard controller for the Opportunity object
    }
    
    //method called from the Visualforce page action attribute
    public PageReference prepopulateValues() {
        
        Map<String, String> passedParams = System.currentPageReference().getParameters(); //grab the parameters for the current page
        PageReference pageWhereWeEndUp = new PageReference('/006/e'); //set the return page reference to the New Opportunity page
        
        pageWhereWeEndUp.getParameters().putAll(passedParams); //copy all of the mappings from passedParams map to pageWhereWeEndUp map (in case Salesforce sends something we don't know we need)
        
        //if the Account Id was passed
        if (passedParams.containsKey('accid')) { //if the passedParams map contains the key accid
            List<Account> accounts = [SELECT Name FROM Account WHERE Id = :passedParams.get('accid')]; //query for Account.Name
            if (!accounts.isEmpty()) { //if the query resulted in a record
                pageWhereWeEndUp.getParameters().put('opp3', accounts[0].Name+' - '+Date.Today().format()); //pass the Opportunity Name value formatted as the Account.Name - date
            }
        }
            
        pageWhereWeEndUp.getParameters().put('opp11','Prospecting'); //StageName = Prospecting
        pageWhereWeEndUp.getParameters().put('opp9',Date.Today().addDays(30).format()); //Close Date defaulted to 30 days from now
        
        //you may get invalid session errors while trying to automatically save via redirect so we need to remove any auto save keys from the map
        String dropSaveNew = pageWhereWeEndUp.getParameters().remove('save_new'); //remove the save_new key value pair
        String dropSave = pageWhereWeEndUp.getParameters().remove('save'); //remove the save key value pair
        
        pageWhereWeEndUp.getParameters().put('nooverride', '1'); //prevents looping after recordtype selection (if applicable)
        pageWhereWeEndUp.setRedirect(true); //indicate that the redirect should be performed on the client side
        return pageWhereWeEndUp; //send the person on their way
    }

}