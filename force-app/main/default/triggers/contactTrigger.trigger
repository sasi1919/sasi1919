/*
    Created by: Greg Hacic
    Last Update: 30 July 2015 by Greg Hacic
    Questions?: greg@interactiveties.com
    
    Notes:
        - tests located at contactTriggerTest.class
*/
trigger contactTrigger on Contact(after insert) {
    
    contactTriggerHandler handler = new contactTriggerHandler(); //construct the trigger handler
    
    if (Trigger.IsInsert && Trigger.isAfter) { //after insert
        handler.OnAfterInsert(Trigger.new); //pass the new List of records to the handler for processing
    }

}