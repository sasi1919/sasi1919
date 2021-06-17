trigger Candidate_ph_trigger on Candidate__c (after update)
{
List<Job_Application__c> jobappmobile = new list<Job_Application__c>();
set<Id> canid = new set<Id>(); 
    for(Candidate__c  can: Trigger.New)
    {
    if (Trigger.newmap.get(can.id).Phone__c <> Trigger.oldmap.get(can.id).Phone__c)
    system.debug('New Phone number: '+ Trigger.newmap.get(can.id).Phone__c);
    system.debug('old Phone number: '+ Trigger.oldmap.get(can.id).Phone__c);
        {
        canid.add(can.id);
        system.debug('Candidate Id : '+ can.id);
        }
    }
    if (canid.size() > 0)
    {
    Map<Id,Candidate__c > candetails= new map<Id,Candidate__c >([select Name,Phone__c from Candidate__c where id in :canid]);
    List<Job_Application__c> jobapps = new List <Job_Application__c>([select Id,Candidate__c from Job_Application__c where Candidate__c in : canid]);
            for(Job_Application__c jobapp: jobapps )
            {
            Candidate__c cand = new Candidate__c();
            cand = candetails.get(jobapp.candidate__c);
            jobapp.candidate_ph__c = cand.Phone__c;
            system.debug('Phone number : ' +cand.Phone__c );
            jobappmobile .add(jobapp);
            }
    }
    update jobappmobile ;
}