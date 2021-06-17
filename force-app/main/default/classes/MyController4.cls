public class MyController4 {

    private final Account account;
    public string selval {get;set;}
    public boolean option;

    public MyController4() 
    {
       selval = 'No'; 
    }

    public Account getAccount() {
        return account;
    }

    public PageReference save() {
        update account;
        return null;
    }
    public string selectedvalue()
    {
        if(selval == 'Yes')
        {
        return 'Yes';
        }
        else
        {
            return 'No';
        }
    }
}