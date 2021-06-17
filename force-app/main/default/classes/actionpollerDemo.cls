public class actionpollerDemo {
 public String name { get; set; }
 public Integer count { get;set; }
  public actionpollerDemo(){
    name = UserInfo.getName(); 
    count = 10;  
  }
 
  public void startCounting(){  
    name = UserInfo.getName()+' after ' + count + ' seconds';  
    count += 10; 
  }
}