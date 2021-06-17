trigger Trigger_Opp on Opportunity (before insert,before update) 
{
    for(Opportunity opp:trigger.new)
    {
        if(opp.Type != 'New Customer')
        {
            opp.adderror('Please select the type as New customer to proceed');
        }
    }
}