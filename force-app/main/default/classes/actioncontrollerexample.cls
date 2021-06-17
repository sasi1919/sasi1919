public class actioncontrollerexample 
{
public integer totalmark{get;set;}
public double avg{get;set;}
public integer mark1{get;set;}
public integer mark2{get;set;}
public integer mark3{get;set;}
public integer mark4{get;set;}
public integer mark5{get;set;}
public PageReference total()
       {
        totalmark=mark1+mark2+mark3+mark4+mark5;
        avg=totalmark/5;
        return null;
        }

}