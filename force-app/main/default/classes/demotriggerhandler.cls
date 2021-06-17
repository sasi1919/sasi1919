public class demotriggerhandler 
{
    public static void beforeinsert(list<account> acc)
    {
        system.debug('Before insert');
    	system.debug('Trigger new '+ acc); 
        for(account accnt:acc)
        {
            accnt.Phone='123456';
            
        }
    }
    public static void afterinsert(list<account> acc)
    {
        system.debug('Before insert');
    	system.debug('Trigger new '+ acc); 
    }
        public static void beforeupdate(list<account> acc)
    {
        system.debug('Before insert');
    	system.debug('Trigger new '+ acc); 
    }
        public static void afterupdate(list<account> acc)
    {
        system.debug('Before insert');
    	system.debug('Trigger new '+ acc); 
    }
}