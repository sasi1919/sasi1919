trigger address_account on Contact (before insert,before update) 
{
demo__c myCS1 = demo__c.getOrgDefaults();
if(myCS1.Check__c)
{
set<id> accid = new set<id>();
for(contact con:trigger.new)
{
accid.add(con.accountid);
}
map<id,account> accdetails = new map<id,account>([select Id,name,shippingstreet,shippingcity,shippingpostalcode from account where id in :accid]);
for(contact cont:trigger.new)
{
account acc = accdetails.get(cont.accountid);
cont.Mailingstreet = acc.shippingstreet;
cont.Mailingcity = acc.shippingcity;
cont.Mailingpostalcode = acc.shippingpostalcode;

}
}

}