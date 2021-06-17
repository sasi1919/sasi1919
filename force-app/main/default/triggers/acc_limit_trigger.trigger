trigger acc_limit_trigger on Account (before insert,before update) 
{
List<Account> accde = [select Id from Account where type = 'Customer'];
integer count=accde.size();
for(Account acc:Trigger.New)
{
if (acc.type == 'Customer' && Count !=2)
    {
    integer count = count+count;
    if (count >2)
    {
    acc.adderror('Limit cannot be exceeded by 2');
    }
    }
    else
    {
    acc.adderror('Limit cannot be exceeded by 2');
    }
}

}