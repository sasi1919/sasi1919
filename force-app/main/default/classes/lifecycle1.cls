public with sharing class lifecycle1 {

    private final Account acct;
    Integer EmpAdd;

    public lifecycle1(myController controller) {
        this.acct = (Account)controller.getAccount();
    }

    public String getGreeting() {
        return acct.name + ' Current Information';
    }
    
    public void resetEmp() {
        acct.numberofemployees = 10;
        update acct;
    }
}