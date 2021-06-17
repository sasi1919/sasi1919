trigger useopp_trigger on Opportunity (before insert) 
{
    set<Id> userid = new set<Id>();
    for(Opportunity opp:Trigger.New)
    {
        if(opp.Name <> ' ')
        {
        userid.add(opp.OwnerId);
        }
    }
    Map<Id,User> ownerdetails = new Map<Id,User>([select Name from User where Id in :userid]);
    
    for(Opportunity opp:Trigger.New)
    {
        User own = ownerdetails.get(opp.OwnerId);
    }
}