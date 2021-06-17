public class a1 
{
    public string keyword{get;set;}
    public list<account> acc {get;set;}
    public string errormessage {get;set;}
    public integer recordcount {get;set;}
    //acc   = [select id,name,phone from Account where name = :keyword];
    public pagereference acclist()
    {
        acc = [select id,name,phone,type from Account where name like :('%' + keyword + '%')];
        //acc = (list<Account>)[FIND :keyword in all fields RETURNING Account(Name,phone,type)];
        system.debug('Account size : ' + acc.size());
        if(acc.size() > 0)
        {         
         recordcount = acc.size();   
         errormessage = '';
         return null;
        }
        else
        {
            recordcount = 0;
            errormessage = 'Error: No records existed';
            return null;
        }
    }
}