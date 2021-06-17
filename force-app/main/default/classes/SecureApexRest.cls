@RestResource(urlMapping='/secureApexRest')
global with sharing class SecureApexRest {
    @HttpGet
    global static Contact doGet(){
        Id recordId = RestContext.request.params.get('id');
        Contact con;
        if (recordId == null){
            throw new FunctionalException('Id parameter is required');
        }
        try{
            List<Contact> conresults = [SELECT id, Name, Secret_Key__c FROM Contact WHERE Id = :recordId WITH SECURITY_ENFORCED];
            if (!conresults.isEmpty()) {
                con = conresults[0];
            }
        }catch(QueryException QE){
            throw new SecurityException('You don\'t have access to all contact fields required to use this API');
        }
        return con;
    }
    public class FunctionalException extends Exception{}
    public class SecurityException extends Exception{}
}