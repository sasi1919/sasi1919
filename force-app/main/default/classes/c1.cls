public class c1{

    public PageReference acts() {
        return null;
    }

Account act = new Account();
List<Account> acts = new List<Account>();
public List<Account> getacts(){
acts = [select Name,Type from Account];
return acts;
}
public Account getact(){
act = [select Name,Type from Account where Name ='sasikumary'];
return act;
}
public Account act(){
act = [select Name,Type from Account where Name ='sasikumary'];
return act;
}

}