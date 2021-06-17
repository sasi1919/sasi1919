public class search{
string a;
List<Team_Member__c> members;
public List<Team_Member__c> gettmembers(){
return members;
}
public string geta(){
return a;
}
public void seta(string c){
a=c;
}
public PageReference search(){
members = [select Name,Team_Name__c,Team_lead__c,Email_Id__c from  Team_Member__c];
return null;
}
}