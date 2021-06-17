public class LeadProcessor implements Database.Batchable<sObject>
{
    public static Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('select Id,LeadSource from Lead');
    }
    public void execute(Database.BatchableContext bc, List<Lead> leaddetails)
    {
        list<lead> leads = new list<lead>();
        for(Lead l:leaddetails)
        {
            l.Leadsource = 'Dreamforce';
            leads.add(l);
        }
        update leads;
    }
    public void finish(Database.BatchableContext bc)
    {
         Id job= bc.getJobId();
        system.debug('Finished' + job);
    }

}