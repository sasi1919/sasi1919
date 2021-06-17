trigger lead_trigger on Team_lead__c (after update) 
{
    set<Id> leadid = new set<Id>();
    for (Team_lead__c  lead: Trigger.New)
    {
        if (lead.Email_Id__c != null)
            {
            leadid.add(lead.Id);
            }
    }
    //Map<Id,Team_Member__c> memberdetails = new Map<Id,Team_Member__c>([select Id from Team_Member__c where Id in:leadid]);
    List<Team_Member__c> teammemberdetails = [select Id,Team_Lead__c from Team_Member__c where Team_Lead__C in:leadid];
    for (Team_Member__c teammember: teammemberdetails )
    {
        //Team_Member__c member = new Team_Member__c() ;
        Team_lead__c leadde = Trigger.newmap.get(teammember.Team_Lead__c);
        teammember.Team_Lead_mail_id__c = leadde.Email_Id__c ;
        //members.add(member);   
    }
    update teammemberdetails ;
}