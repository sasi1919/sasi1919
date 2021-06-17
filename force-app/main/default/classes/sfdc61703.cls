public class sfdc61703{

    public String thankYouMsg {get;set;}
    public String yourName {get;set;}
    private Integer counter {get;set;}
    
    public sfdc61703() {
        counter = 0;
    }
    
    public PageReference processName() {
        counter += 1;
        addThankYou(yourName);
        addPageMessage('Your name is: '+ yourName);
        return null;        
    }

    private void addPageMessage(String t) {
        ApexPages.addMessage(new ApexPages.Message(
            ApexPages.Severity.INFO, t));
    } 
    
    private void addThankYou(String t) {
        thankYouMsg = 'Thanks ' + t + '. You are a peach. You have loaded this page ' + 
            counter + ' times.';
    } 

}