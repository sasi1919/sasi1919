Public with sharing class SendemailController{
   Public SendemailController(){
   }
  
 Public void sendEmailFunction(){
   Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
   String[] toAddresses = new String[] {'testreceipient1@mail.com','testreceipient1@mail.com'}; 
   String[] ccAddresses = new String[] {'testcc1@mail.com','testcc1@mail.com'};
   mail.setToAddresses(toAddresses);
   mail.setCcAddresses(ccAddresses);
   mail.setReplyTo('myemail@mail.com');
   mail.setSenderDisplayName('My Name');
   mail.setSubject('Testing email through apex');
   mail.setBccSender(false);
   mail.setUseSignature(false);
   mail.setPlainTextBody('This is test email body. This mail is being sent from apex code');
   //mail.setHtmlBody('<b> This is HTML body </b>' );
   Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
 } 

}