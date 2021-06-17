public with sharing class RestWebService {
    
    public Double temperature{    
                get;
                set;
      }
      
      public String location{
              get;
              set{
                    if(value !=null){
                        location = value;
                    }              
              }
      }
          
      
      public void getWeatherInformation(){
          ChennaiWeather chn = new ChennaiWeather();
          temperature= chn.getWeatherInfo(location);
      }
    
}