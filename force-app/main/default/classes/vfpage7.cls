public class vfpage7 
{
    public string type {get;set;}
    public list<account> acc {get;set;}
    public pagereference acclist()
    {
        system.debug('type : ' + type);
        acc = [select id,name,Phone,Type from account where type = :type limit 10];
        return null;
    }

}