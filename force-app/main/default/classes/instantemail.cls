public class instantemail {
public static void instantsendemail(string sendto)
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