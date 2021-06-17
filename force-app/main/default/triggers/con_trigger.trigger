trigger con_trigger on Contact (before insert,before update) 
{
for(Contact con: Trigger.new)
{

if([select Id from contact where AccountId =:con.AccountId].size()>0)
{
con.adderror('Primary record is already present');
}
}

}