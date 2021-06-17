public class addnum{

    public addnum() {
      
    }
    integer a,b,c;
    string d='Addition';
    string e='Subtraction';
    public integer geta()
    {
    return a;
    }
    public integer getb()
    {
    return b;
    }
    public integer getc()
    {
    return c;
    }
    public void seta(integer f)
    {
    a = f;
    }
    public void setb(integer s)
    {
    b = s;
    }
    public pagereference add()
    {
     if (a>b){
     c = a-b;
     }
     else
     {
     c=a+b;
     }
    return null;
    }
    public string getmessage(){
     if (a>b){
     return e;
     }
     else
     {
     return d;
     }
     }
}