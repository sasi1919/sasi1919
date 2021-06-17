trigger team_trigger on Teams__c (before insert) 
{
for(Teams__c  t: Trigger.New)
{
Teams__c  newt = new Teams__c();
    if( [select Name from Teams__c  where Name = :t.name].size() > 0 )
    {
    t.adderror('Record alredy exists');
    }
}
}