trigger account_name on Teams__c (after insert) 
{
list<teams__c> teams = [select Id,LeadName__c from Teams__c];
list<teams__c> teamsaccs =  new list<teams__c>();
for(Teams__c team: trigger.new)
{
for(teams__c teamacc: teams)
{
   teamacc.LeadName__c = team.LeadName__c;
   teamsaccs.add(teamacc);

}
update teamsaccs ;
}

}