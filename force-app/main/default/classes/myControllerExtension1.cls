public class myControllerExtension1 {

    public myControllerExtension1(listcontrol1 controller) {

    }


    private final Team_Task__C acct;
    
    // The extension constructor initializes the private member
    // variable acct by using the getRecord method from the standard
    // controller.

    public String getGreeting() {
        return 'Hello Sasi';
    }
}