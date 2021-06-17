global class ApexScheduledClass Implements Schedulable
{
           global void execute(SchedulableContext sc)
            {
                addsitememebers();
            }
            public void addsitememebers()
            {
                list<Site_Members__c> sitemembers = new list<Site_Members__c>();
                set<id>usrid = new set<id>();
                boolean add_status = true;
				map<id,user> userlistmap = new map<id,user>([select id,name,site_id__c,Isactive from user]);
                list<account> acclist = [select id,name,ownerid,site_id__c from account];
                for (account acc:acclist)
                {
                    system.debug('account details :' + acc);
                    if((!usrid.contains(acc.OwnerId)) || (add_status == true))
                    {                    
                    add_status = true;
                    usrid.add(acc.OwnerId);
                    user usr = userlistmap.get(acc.OwnerId);
                    system.debug('user detials: ' + usr);
                    system.debug('user site id: ' + usr.Site_id__c + 'acc site id:' + acc.site_id__c + usr.Isactive);   
                    if((usr.Site_id__c == acc.site_id__c) && (usr.Isactive == false))
                    {
                        add_status = false;
                        Site_Members__c member = new Site_Members__c();
                        member.Account__c = acc.id;
                        member.User__c = usr.id;
                        member.Name = acc.name;
                        system.debug('member details :' + member);
                        sitemembers.add(member);     
                    }   
                    }
                }
                system.debug('Site member details :' + sitemembers);
                insert sitemembers;
            }
}