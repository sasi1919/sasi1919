public class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext ctx) {
        List<Lead> leadlist = [Select Id, LeadSource from Lead where LeadSource = null];
        if(!leadlist.isEmpty()) {
            for(Lead l: leadlist) {
                l.LeadSource = 'Dreamforce';
            }
            update leadlist;
        }
    }
}