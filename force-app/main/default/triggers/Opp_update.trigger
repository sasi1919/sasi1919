trigger Opp_update on Opportunity (before insert,before update)
{
	for(Opportunity opp:trigger.new)
    {
        if(trigger.isInsert)
        {
             opp.Type = 'Customer - Direct';
        }
        if(trigger.isUpdate)
        {
             opp.status__c = 'Pending';
        }               
    }
}