global class soapapiexample 
{
    global class ResponseClass{
        webService String responseerror;
        webService String responseResultName;
    }    
    webservice static ResponseClass saywelcome(string name)
    {
        ResponseClass ress = new ResponseClass();
        try
        {
        string myname = name;
        if(String.isnotBlank(myname))
        {
        	ress.responseResultName = 'Hello ' + name + ' Welcome to saelsforce1'; 
        }
        else
        {
            throw new Customexception('This field should not empty');           
        }
        }
        catch (Customexception e) { 
            system.debug(e.getMessage());
			ress.responseerror = e.getMessage() ;
        }
      return ress;
    }
}