public class extn{

    public PageReference task() {
        return null;
    }


    public extn(ApexPages.StandardSetController controller) {

    }

Team_Task__c task = new Team_Task__c();

    public extn() 
    {
        task= [SELECT Name,Team_Member__c,Priority__c,Date__c FROM Team_Task__c 
                   WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
    }

    public Team_Task__c gettask(){
    return task;
    }

}