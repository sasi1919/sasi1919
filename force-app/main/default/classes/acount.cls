public class acount{
    List<Account> acc = [select Name, Phone, BillingAddress from Account];
    public List<Account> acc(){
        return acc;
    }
    
}