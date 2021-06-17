public with sharing class sfdc1 {

    public String getInput() {
        return input;
    }


    public String Input;
    public string output; 
    public void setinput(string input1)
    {
        this.input=input1;
    this.output=input1.replaceAll( '\\s+', '');

    }
    public string getoutput()
    {
    return output;
    }
    public pagereference convert()
    {
    
    return null;
    }
    
}