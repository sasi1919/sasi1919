trigger contact_rec on Opportunity (before insert,after insert) {
    Contact a = new contact();
    for(Opportunity opp : Trigger.new)
    {
        if (Trigger.isInsert && opp.amount < 5000)
        {
            opp.addError('Amount can not be less than 5000'); 
        }
    }
    for(Opportunity opp : Trigger.new){
        if (Trigger.isAfter)
        {
         a.AccountID = opp.AccountID;
         a.FirstName = opp.name;
         a.LastName = 'owner';
              insert a;     
         }  
 
    }
    
}