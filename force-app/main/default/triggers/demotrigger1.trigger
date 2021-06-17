trigger demotrigger1 on Contact (before insert,before update) 
{
    demotrigger1handler.error(trigger.new);
}