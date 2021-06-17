public class remoteaction
{
public string name{get;set;}
@RemoteAction
public static list<Teams__c> getrecords(string name)
{
system.debug('name'+name);
string query = 'select Name,size__c,team_short_name__c,account__r.name from teams__c where name LIKE \'%' + name + '%\'';
list<teams__c> teamlist = database.query(query);
system.debug('team list'+teamlist );
return teamlist ;
}
}