public class members{
List<Team_Member__c> members;
public List<Team_Member__c> gettmembers(){
return members;
}
public pagereference tmall(){
members = [select Name,Team_Name__c,Team_lead__c,Email_Id__c from Team_Member__c order by Team_Name__c ];
return null;
}
public pagereference team1(){
members = [select Name,Team_Name__c,Team_lead__c,Email_Id__c from Team_Member__c where Team_Name__c = 'Team1' ];
return null;
}
public pagereference team2(){
members = [select Name,Team_Name__c,Team_lead__c,Email_Id__c from Team_Member__c where Team_Name__c = 'Team2' ];
return null;
}
public pagereference team3(){
members = [select Name,Team_Name__c,Team_lead__c,Email_Id__c from Team_Member__c where Team_Name__c = 'Team3' ];
return null;
}

}