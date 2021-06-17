trigger trigger_status on Opportunity (before insert,before update) 
{
list<opportunity> oppclosedwon = [select Id,Name,StageName,amount from opportunity where StageName= 'Closed Won'];
list<opportunity> oppclosedlos = [select Id,Name,StageName,amount from opportunity where StageName= 'Closed Lost'];
list<opportunity> oppselected = new list<opportunity>();
list<opportunity> oppstoadd = new list<opportunity>();
for(opportunity opp:trigger.new)
{
    if(opp.StageName == 'Closed Won')
    {
    oppselected = oppclosedlos;
    }
    else if(opp.StageName == 'Closed Lost')
    {
    oppselected = oppclosedwon;
    }
    for(opportunity opps:oppselected)
    {    
        if(opp.amount==opps.amount)
        {
        opp.adderror('Amount with same stage is already added');
        }
    }
}
}