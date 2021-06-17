trigger sampletrigger on Account(before insert,after insert, before update, after update)
{
for(Account acc:trigger.new)
{
    if(trigger.isbefore && trigger.isinsert)
    {
    acc.AccountNumber = '4567'; 
    }
}
}