@RestResource(urlMapping='/customSalesforceUrl')
global class CustomInbound {
	
    @HttpGet
    global static List<Case> getRequest(){
        List<Case> listCase = [select caseNumber, case.Account.Name from Case];
        //return 'Get Request is Called';
        return listCase;
    }
    
     @HttpPost
    global static String postRequest(){
        return 'Post Request is Called';
    }
    
    
      @HttpPut
    global static String putRequest(){
        return 'Put Request is Called';
    }
    
    @HttpDelete
    global static String deleteRequest(){
        return 'Delete Request is Called';
    }
}