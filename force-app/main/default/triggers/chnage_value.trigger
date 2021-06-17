trigger chnage_value on Teams__c (before insert,before update) 
{
for(teams__c team:trigger.new)
{
team.size__c = 100;
}
}