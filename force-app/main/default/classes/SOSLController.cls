Public with sharing class SOSLController{
Public String searchStr{get;set;}

Public SOSLController(){
}

Public pagereference search_method(){
    list <account> accList = New List<account>();
    if(searchStr.length() > 2)
    {
    String searchStr1 = '*' +searchStr+ '*';
   // String searchQuery = 'FIND :searchStr1 IN ALL FIELDS RETURNING  Account(Id,Name,type)';
    List<List <sObject>> searchList = [FIND :searchStr1 IN ALL FIELDS RETURNING  Account(Id,Name,type)];
    accList = (searchList[0]);
        if(accList.size() == 0)
        {
        apexPages.addmessage(new apexpages.message(apexpages.severity.Error, 'Sorry, no results returned with matching string..'));
        }
        else
        {
        apexPages.addmessage(new apexpages.message(apexpages.Severity.CONFIRM, 'Results returned with matching string..'));                
        }
    }
    else
    {
    apexPages.addmessage(new apexpages.message(apexpages.severity.warning, 'Please enter at least two characters..'));
    }
    return null;
    }
}