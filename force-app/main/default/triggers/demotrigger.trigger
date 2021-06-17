trigger demotrigger on Account (before insert,after insert,before update,after update,before delete,after delete) 
{
    if(trigger.isbefore)
    {
        if(trigger.isinsert)
        {
	        demotriggerhandler.beforeinsert(trigger.new);
        }
        if(trigger.isupdate)
        {
           demotriggerhandler.beforeupdate(trigger.new);
        }       
    }
    if(trigger.isafter)
    {
        if(trigger.isinsert)
        {
    	   demotriggerhandler.afterinsert(trigger.new);           
        }
        if(trigger.isupdate)
        {
		  demotriggerhandler.afterupdate(trigger.new);        
        }      
    }

}