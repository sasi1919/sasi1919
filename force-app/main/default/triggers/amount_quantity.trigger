trigger amount_quantity on Team_Task__c (after insert,after update) 
{
list<team_member__c> member = new list<team_member__c>();
for(team_task__c task: trigger.new)
    {
    team_task__c taskduplicate = task;
    team_member__c mem = [select Id,Name,total_amount__c,total_quantity__c from team_member__c where Id= :taskduplicate .team_member__c];
        if(mem.total_amount__c !=null)
        {
        mem.total_amount__c = mem.total_amount__c + taskduplicate .amount__c;
        }
        else
        {
        mem.total_amount__c = 0;
        mem.total_amount__c = mem.total_amount__c + taskduplicate .amount__c;   
        }
        if(mem.total_quantity__c!= null && taskduplicate .quantity__c != null)
        {
        mem.total_quantity__c = mem.total_quantity__c + taskduplicate .quantity__c;
        }
        else
        {
        mem.total_quantity__c = 0;    
        mem.total_quantity__c = mem.total_quantity__c + taskduplicate .quantity__c;
        }
    member.add(mem);
    }
update member;
}