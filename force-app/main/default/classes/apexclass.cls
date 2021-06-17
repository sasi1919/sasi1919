public class apexclass
{
public void apexsasi(){
list<contact> conlist = [select id,accountid,FirstName from contact where accountid='0017F00000QEFoy'];
        contact_count__c t = contact_count__c.getInstance('Test');
        t.count__c= 0;
        update t;
Id sasi= Database.executeBatch(new batchapex1(conlist), 20);
}

}