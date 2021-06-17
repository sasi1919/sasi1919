trigger account_address on Account (after update)
{
set<id> accid = new set<id>();
list<contact> contacts = new list<contact>();
    for(Account acc: trigger.new)
    {
    accid.add(acc.id);
    }
    list<contact> contactrecords = [select AccountId,name,Mailingcity,Mailingstate,Mailingpostalcode from contact where accountid in:accid];
    for(contact con: contactrecords)
    {
      Account accn = trigger.newmap.get(con.accountId);
      con.Mailingcity= accn.shippingcity;
      con.Mailingstate= accn.shippingstate;
      con.Mailingpostalcode= accn.shippingpostalcode;
      contacts.add(con);
    }
    update contacts;
}