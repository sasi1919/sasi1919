trigger Job_Application_trigger on Job_Application__c (before insert,before update) 
{
    integer count =0;
    List<Job_Application__c>  jobnew = new List<Job_Application__c> ();
    for(Job_Application__c job: Trigger.new)
    
    {
    count = count+1;
        if (count<10)
        {       
        jobnew.add(job);
        }
        else
        {
        job.adderror('record limit exceeded');
        }
    }
    insert jobnew;

}