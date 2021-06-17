public with sharing class wrapperexample 
{

    public PageReference processselected() {
        return null;
    }

list<Team_task__c> tasks = new list<team_task__c>();
list<Work_Order__c> workorder = new list<Work_Order__c>();
list<wrapper> wrapperlist = new list<wrapper>();
list<wrapper> wrapperlst = new list<wrapper>();  
list<wrapper> processselected= new list<wrapper>();  
    public wrapperexample ()
    {

    }
    public void setwrapperlist(list<wrapper> wrapperlst)
    {
      wrapperlist = this.wrapperlst;
    }
    public list<wrapper> getwrapperlist()
    {
    tasks = [select Name,team_member__c,Member_email__c from Team_task__c];
    workorder = [select Name,developer__c from Work_Order__c];
        for(integer i=0;i<20;i++)
        {
        wrapper wrap = new wrapper(tasks[i].name,tasks[i].team_member__c,tasks[i].Member_email__c ,workorder[i].name,workorder[i].developer__c);
        wrapperlist.add(wrap);
        }
        return wrapperlist;
    }    
    public list<wrapper> getprocessselected()
    {
     processselected=new list<wrapper>();
     
      for(wrapper wrapselect:wrapperlist){
           if(wrapselect.isSelected==true){
           processselected.add(wrapselect);
           }
            
         } 
         return   processselected;  
    }

public class wrapper
{
public string tname{get;set;}
public string Teammember{get;set;}
public string email{get;set;}
public string WName{get;set;}
public string developer{get;set;}
public boolean isSelected{get;set;}
public wrapper(string tname,string teammember,string email,string wname,string developer)
{
this.tname=tname;
this.teammember=teammember;
this.email=email;
this.wname=wname;
this.developer=developer;
}
}
}