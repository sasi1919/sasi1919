trigger rate_sum on Account (after insert,after update) 
{
set<id> accid = new set<id>();
for(Account acc:trigger.new)
{
accid.add(acc.id);
}
//list<contact> cons = [select Id,name from contact where accountid in :accid];
map<id,contact> contacts = new map<id,contact>([select Id,name from contact where accountid in :accid]);
}