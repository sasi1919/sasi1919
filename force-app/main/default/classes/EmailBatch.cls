Public class EmailBatch implements Database.Batchable<sObject> 
{ 
   Public Database.QueryLocator start(Database.BatchableContext BC) 

  { 
    String query ='SELECT ID, Email FROM Contact'; 
      return Database.getQueryLocator(query); 
  } 

    Public void execute(Database.BatchableContext BC, List<sObject> scope) 

   { 
       List<Contact> listToUpdate = new List<Contact>(); 
        for( Contact con: (List<Contact> ) scope) 
        {  
            if(con.Email != null && con.Email != '' && con.Email.contains('@example.com'))
            {
              string str = con.Email.replace('@example.com','@gmail.com');
              con.Email= str;
              listToUpdate.add(con);
            }   
        } 
        if(listToUpdate.size() > 0) 
       { 
            update(listToUpdate);  

       } 

   } 
   Public void finish(Database.BatchableContext BC){ 
  } 

}