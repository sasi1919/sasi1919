trigger usecon_trigger on Contact(before insert,before update) 
{
    set<Id> userid = new set<Id>();
    for(Contact con:Trigger.New)
    {
        if(con.Name <> ' ')
        {
        userid.add(con.OwnerId);
        }
    }
    Map<Id,User> ownerdetails = new Map<Id,User>([select Name,Email from User where Id in :userid]);
    
    for(Contact con:Trigger.New)
    {
        User own = ownerdetails.get(con.OwnerId);
        if (own.Name =='Sasikumar Yadla'){
         con.Email=own.Email;
        }
    }
}