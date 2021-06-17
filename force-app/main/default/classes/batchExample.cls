global class batchExample implements Database.Batchable<sObject> {
    /**
    */
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
         
        String query = 'SELECT Id,Name FROM Team_Member__c';
        return Database.getQueryLocator(query);
    }
     
    global void execute(Database.BatchableContext BC, List<Team_member__c> memList) {
        
        // process each batch of records
 
         
        for(Team_member__C mem : memlist)
        {        
            // Update the Account Name 
            mem.Name = mem.Name + 'batchtest';
        }
        try {
            // Update the Account Record
            update memlist;
         
        } catch(Exception e) {
            System.debug(e);
        }
         
    }   
     
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations
  }
}