public class contact_count_help
{
public static void conrec(list<account> accdetails)
{
for(account acc:accdetails)
{
acc.Number_of_contacts__c = [select Id from Contact where accountid=:acc.id].size();
}

}

}