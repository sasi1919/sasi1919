public class AccountHandler 
{ 
    public static Account insertNewAccount(string nam)
    {
       if(nam!='')
       {    
        Account acc = new Account(Name = nam);
        try {
             insert acc;
            system.debug(acc);
             return acc;
            } catch (DmlException e)
            {
             System.debug('A DML exception has occurred: ' +
                e.getMessage());
              return null;
            }
        }
        else
        {
            return null;
        }
    }
}