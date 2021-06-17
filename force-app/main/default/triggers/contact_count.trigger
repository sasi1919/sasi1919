trigger contact_count on Account (before update) 
{
if (trigger_enable__c.getinstance('contact_count').status__c)
{
contact_count_help.conrec(trigger.new);
}
}