public class RandomContactFactory 
{
    public static List<Contact> generateRandomContacts(integer numofcon,string lastname)
    {
        List<contact> listcon = new list<Contact>();
        for(integer i=0;i<numofcon;i++)
        {
        contact con = new contact();
        con.firstname = 'Test' + i;
        con.LastName = lastname +i;
        listcon.add(con);
        }
        //insert listcon;
        return listcon;
    }
}