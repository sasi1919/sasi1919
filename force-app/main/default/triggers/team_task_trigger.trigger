trigger team_task_trigger on Team_Task__c (before insert,before update) 
{
    if (Trigger.isbefore && Trigger.isinsert)
        {
        tt_helper.checkerror(Trigger.New);
        }
    else
        {
        tt_helper.checkupderror(Trigger.New);
        }
}