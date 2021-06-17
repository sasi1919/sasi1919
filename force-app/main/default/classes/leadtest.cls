public class leadtest 
{
    public static void leadadd()
    {
        list<lead> newleads = new list<lead>();
        for(integer i=0;i<200;i++)
        {
            lead l = new lead();
            l.Firstname = 'test' + i;
            l.LastName = 'name' + i;
            l.Company = 'tcs';
            l.Status='Open - Not Contacted';
            newleads.add(l);
        }
        system.debug('New lead details :'+ newleads);
        insert newleads;
    }
}