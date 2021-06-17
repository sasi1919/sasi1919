/*
    Created by: Greg Hacic
    Last Update: 30 July 2015 by Greg Hacic
    Questions?: greg@interactiveties.com
    
    Notes:
        - tests located at contactTriggerTest.class
*/
public class contactTriggerHandler {
    
    public void OnAfterInsert(List<Contact> newRecords) {
        if (isOkayToRun) { //if it is okay to run the trigger
            contactAfterInsertLogic(newRecords); //pass the List of new records to the contactAfterInsertLogic for processing
        }
    }
    
    //determines whether or not the trigger logic is okay to run
    public static Boolean isOkayToRun {
        //getter constructor
        get {
            Boolean returnBoolean = true; //default the boolean return value to true - this is done to make sure the trigger fires when the developer fails to create a corresponding Custom Setting record
            Trigger_Status__c t = Trigger_Status__c.getInstance('contactTrigger'); //grab the Trigger_Status__c custom setting object record named contactTrigger
            if (t != null) { //if there was a record found
                returnBoolean = t.Status__c; //set the returnBoolean value to the Status__c boolean value for the found record
            }
            return returnBoolean; //return the boolean value
        }
    }
    
    //method for processing of actual business logic related to the trigger
    private void contactAfterInsertLogic(List<Contact> newRecords) {
        for (Contact c : newRecords) { //for all records
            //do something here
        }
    }

}