trigger amount_trigger on Opportunity (before insert,before update) {
    if (Trigger.isInsert)
    {
        for(Opportunity opp : Trigger.new)
        {
            if (opp.amount < 5000)
            {
               opp.addError('Amount can not be less than 5000');
            }    
        }
    }
    if (Trigger.isUpdate)
    {
        for(Opportunity opp : Trigger.new)
        {
            if (opp.amount < 3000)
            {
               opp.addError('Amount can not be less than 3000');
            }    
        }
    }    
}