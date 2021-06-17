public class Cartype 
{
	@auraenabled
    public static list<Car_Type__c> getcars()
    {
        list<Car_Type__c> carlist = [select id,Name from car_type__c];
        return carlist;
    }
}