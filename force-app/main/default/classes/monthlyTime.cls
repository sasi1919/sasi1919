public class monthlyTime {
    
    public Integer monthSelection = Date.Today().Month(); //month > declared here so it can be overwritten in afuture enhancement
    public Integer yearSelection = Date.Today().Year(); //year > declared here so it can be overwritten in afuture enhancement
    public List<timeEntry> timeEntries = new List<timeEntry>(); //custom wrapper object for Date and Time_Card__c details
    public Decimal totalHours = 0.0; //total hours
    
    //constructor
    public monthlyTime() {
        grabTimecards(); //build the list of wrapper objects to display
    }
    
    //grab all of the Time_Card__c records for the employee, project and month
    private void grabTimecards() {
        
        List<Date> daysForMonth = buildDaysInMonth(); //create the list of all days for the month
        timeEntries.clear(); //empty the timeEntries list
        totalHours = 0; //reset the total to zero
        
        //placeholder for loop to grab your custom time card records and increment the overall hours
        
        //construct the list of time entry objects
        for (Date d : daysForMonth) { //for all of the dates in our list
            timeEntries.add(new timeEntry(d, 'placeholder')); //create a new timeEntry object for the date
        }
    }
    
    //grabs all of the days in the month for the selected month & year
    private List<Date> buildDaysInMonth() {
        List<Date> returnList = new List<Date>(); //return list of Dates
        Integer daysInMonth = Date.daysInMonth(yearSelection, monthSelection); //number of days in month
        for (Integer day = 1; day <= daysInMonth; day++) { //for first to last day in month
            returnList.add(Date.newInstance(yearSelection, monthSelection, day)); //add the date to our list
        }
        return returnList; //return the list
    }
    
    //returns the list of wrapper objects
    public List<timeEntry> getTimeEntries() {
        return timeEntries; //return the list
    }
    
    //returns the total of all hours
    public Decimal getTotalHours() {
        return totalHours; //return total hours
    }
    
    //wrapper for Time Card records with Date
    public class timeEntry {
        public Date day {get; set;} //Date
        public String allocationDetails {get; set;} //placeholder for your custom time entry record details
        
        //constructor
        public timeEntry(Date d, String t) {
            this.day = d;
            this.allocationDetails = t;
        }
    }

}