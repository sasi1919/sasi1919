public class position_custom
{
    private integer count=1;   //to track the function calling
    private integer counter=0;   //to keep track of offset
    private integer list_size=5; //to set the page size to show the rows/records
    public integer total_size; //used to show user the total size of the list  
    Public List<Position__c> Pos {get; set;}
    
    public position_custom()
    {
        pos = [select Name,Location__c,Status__c,Type__c,Hiring_Manager__c from Position__C];
        total_size=[select count() from Position__c];    //set the total size in the constructor
    }
    
    public List<Position__c> getnewpos()
    {
    List<Position__c> newpos= [select Name,Location__c,Status__c,Type__c,Hiring_Manager__c from Position__C order by name limit:list_size offset:counter];
    return newpos;
    }    
       
    public pagereference Beginning()
    {
        counter = 0;
        return null;
    }  
    public pagereference Previous()
    {
         counter = counter-list_size;      
         return null;
    }   
  
    public pagereference Next()
    {
        counter = counter+ list_size;   
        return null;
    }
    public pagereference End()
    {
        counter = total_size - math.mod(total_size, list_size);   
        return null;
    }          
    public Boolean getDisabledPrevious()     //this will disable the previous and beginning buttons
    {           
        if(counter>0)
             return false;
         else
             return true;
    }
    public Boolean getDisabledNext()          //this will disable the next and end buttons
    {           
        if(counter + list_size < total_size)
             return false;
         else
             return true;
    }     
    
    public Integer getTotal_size()
    {
      return total_size;
   }
    public Integer getPageNumber() {
        return counter/list_size + 1;
    }
    public Integer getTotalPages() {
        if (math.mod(total_size, list_size) > 0) {
         return total_size/list_size + 1;
      }
      else {
         return (total_size/list_size);
      }
    }    
    
    
    
    
    
    
    
    
    
}