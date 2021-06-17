public with sharing class Customexception1
{
    public class CustomException extends Exception { }
    public Customexception1()
    {
        try
        {
            throw new CustomException('All your base are belong to us');
        }
        catch (CustomException error)
        {
            ApexPages.addMessages(error);
        }
    }
}