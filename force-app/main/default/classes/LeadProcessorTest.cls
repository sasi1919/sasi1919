@istest
public class LeadProcessorTest 
{
    @istest
    public static void leadadd()
    {
        list<lead> testlead = new list<lead>();
        for(integer i=0;i<200;i++)
        {
            lead l = new lead();
            l.Firstname = 'sasi' + i;
            l.LastName = 'kumar' + i;
            l.Company = 'tcs';
            l.Status='Open - Not Contacted';
            testlead.add(l);
        }
        system.debug('New lead details :'+ testlead);
        insert testlead;
    Test.startTest();
        LeadProcessor leadtest = new LeadProcessor();
        Id batchId = Database.executeBatch(leadtest);
    Test.stopTest(); 
    }
    //Lead leaddetails = [select Id,Leadsource from lead where firstname = 'test1'];
    //system.assertEquals(200, [select count() from lead where LeadSource = 'Dreamforce']);        
    
}