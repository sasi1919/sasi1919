trigger mem_email on Team_Task__c (before insert) {

    Set<Id>  memid = new set<id>();
    for (Team_Task__c  tt: Trigger.New)
    {
        if (tt.Name<> ' ')
        {
          memid .add(tt.Team_Member__c);
        }
    }
    Map<id,Team_Member__c> memde = new Map<id,Team_Member__c>([select Email_Id__c from Team_Member__c where id in :memid]);
    
    for (Team_Task__c  tt: Trigger.New)
    {
      Team_Member__c tm = new Team_Member__c();
      tm = memde.get(tt.Team_Member__c);
      if (tm.Email_Id__c <> ' '){
      tt.Member_email__c = tm.Email_Id__c;
      }
    }
}