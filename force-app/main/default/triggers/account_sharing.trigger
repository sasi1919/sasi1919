trigger account_sharing on Account (after update) 
{
    for(Account acc:trigger.new)
    {
    Accountshare aShare = [select Id,AccountId,Accountaccesslevel from Accountshare where AccountId = :acc.Id limit 1];
    ashare.Accountaccesslevel ='Read';
    update ashare;
    }
    

}