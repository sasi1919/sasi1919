public class futuretest
{
@future
public static void sendingemail(string sendto)
{
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    String[] sendtoAddresses = new String[] {sendto};
    mail.setToAddresses(sendtoAddresses);
    mail.setSubject('Future method testing');
    string body = 'This is just for testing purpose';
    mail.setHtmlBody(body);
    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
}
}