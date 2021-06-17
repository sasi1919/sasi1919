global class batchapex1 implements Database.Batchable<contact>

{

global list<contact> conlist;
       

    global batchapex1(list<contact> q)
    {
        conlist=q;
        system.debug('contct list ' + conlist);
    }
    global Iterable<contact> start(Database.BatchableContext BC)
    {
        return conlist;
    }
    global void execute(Database.BatchableContext BC,List<contact> scope)
    {
        contact_count__c t = contact_count__c.getInstance('Test');    
        list<contact> items = new list<contact>();
        for(contact con:scope)
            {
            con.Email= 'batch@gmail.com ';
            items.add(con);
            t.count__c=t.count__c+1;
            }
        database.update(items);
        update t;
    }
    global void finish(Database.BatchableContext BC)
    {
    
    }
}