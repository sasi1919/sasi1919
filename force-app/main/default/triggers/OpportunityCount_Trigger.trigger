trigger OpportunityCount_Trigger on Opportunity (Before Insert, Before Update) {
    
    Integer Count=0;
    List<Opportunity> Ops=[select StageName from Opportunity where StageName=:'Needs Analysis'];
    Count=Ops.size();
    
    for(Opportunity Opp : Trigger.New)
    {
        if(Count>2)
        {
            Opp.addError('Maximim Limit for the selected stage has Reached per day');
        }
    }
}