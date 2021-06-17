@RestResource(urlMapping='/serviceProgram')
	global class RestServiceProgram{
			/*
             * The program will return the list of records of Expense Occured Object
             */
		@HttpGet
		global static List<Expenses_Occured__c> processgetRequest(){          
            
            
            List<Expenses_Occured__c> listExpense = [select Name,Sum_Amount__c from Expenses_Occured__c];
            
			return listExpense;
		}

        	/*
             * The program will insert the records of object named Expenses_Occured__c
             */
		@HttpPost
		global static Expenses_Occured__c processPostRequest(){
            /*
             * In order to read the request data, you need to have the class named
             * RestRequest.
             * 
             * RestContext class will header inforamtion and RestContext.request will read
             * the request data and it will be mapped to object of Request.
             * 
             * If we need to read the request body we need to do following
             * this line will convert the requestbody into string. 
             * request.requestBody.toString();
             * 
             * 
             */
            
            RestRequest request = RestContext.request;
            
            String str = request.requestBody.toString();
            
            
            
            RestExpense ex=(RestExpense)JSON.deserialize(str, RestExpense.class);
            
            Expenses_Occured__c e = new Expenses_Occured__c();
            
            e.Expense_Item__c = ex.Expense_Item;
            e.Price__c = ex.price;
            e.Quantity__c = ex.quantity;
            
            if(e.Price__c < 500){
            try{
            	insert e;
            }
            catch(DmlException d){
                System.debug(d.getMessage());
            }               
            }    
           return e;
		}

		@HttpPut
		global static String processPutRequest(){
            RestRequest reqeust = RestContext.request;
            
            String str = reqeust.requestBody.toString();
            
            RestUpdateExpense ex = (RestUpdateExpense) JSON.deserialize(str, RestUpdateExpense.class);
            
           	Expenses_Occured__c updateRecord = [select 	Quantity__c, Price__c from Expenses_Occured__c where id =: ex.id];
            if(updateRecord !=null){
            	updateRecord.Quantity__c=ex.quantity;
            	updateRecord.Price__c = ex.price;
                try{
                	update updateRecord;
                }catch(DMLException exp){
                    System.debug(exp.getMessage());                  
                }
             }
            
			return 'YOU made Put request';
		}

		@HttpDelete
		global static String processdeleteRequest(){
			return 'YOU made delete request';
		}	
        
           global class RestExpense{
                public String Expense_Item;
                public Integer price;
                public Integer quantity;        
            }
        
         global class RestUpdateExpense{
      	  	public String Expense_Item;
        	public Integer price;
        	public Integer quantity; 
            public String id;
    	}

	}