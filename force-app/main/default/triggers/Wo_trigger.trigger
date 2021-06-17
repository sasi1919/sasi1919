trigger Wo_trigger on Work_Order__c (after insert)
{
List<Team_Task__c> task = new List<Team_Task__c>();
for (Work_Order__c work:Trigger.New)

    {       
        Team_Task__c tt = new Team_Task__c();
        tt.Name = 'tasktrigger';
        //tt.Work_Order__c = work.Name;
        tt.Team_Member__c = work.Developer__c;
        task.add(tt);
    }
   Insert task;
}