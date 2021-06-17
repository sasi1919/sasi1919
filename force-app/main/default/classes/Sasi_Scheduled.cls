global class Sasi_Scheduled Implements Schedulable
    {
    public static String sched = '0 00 00 * * ?';  //Every Day at Midnight 

    global static String scheduleMe() 
    {
        Sasi_Scheduled SC = new Sasi_Scheduled(); 
        return System.schedule('My batch Job', sched, SC);
    }
        global void execute(SchedulableContext sc)
        {
            database.executeBatch(new batch0531());
        }
    }