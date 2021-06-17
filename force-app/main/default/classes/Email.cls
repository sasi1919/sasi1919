public with sharing class Email 
{
public string subject{get;set;}
public string body{get;set;}
//public string[] recipients{get;set;}
list<string> emails = new list<string>{'sasikumar.yadla@gmail.com'};
public pagereference sendemail()
    {
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setsubject(subject);
        email.setToAddresses(emails);
        email.setplaintextbody(body);
        Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email}); 
        return null;
    }
}