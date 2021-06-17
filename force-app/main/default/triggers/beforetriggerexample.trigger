trigger beforetriggerexample on Account (before update,after update,before delete) 
{
    if(trigger.isafter && trigger.isupdate)
    {
	beforetriggerexample_helper.updatecotact(trigger.new,trigger.newmap,trigger.oldmap);
    }
    if(trigger.isdelete)
    {
     beforetriggerexample_helper.deleteopps(trigger.old);
    }
}