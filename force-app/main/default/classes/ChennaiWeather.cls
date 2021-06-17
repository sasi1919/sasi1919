public class ChennaiWeather {
    
            Http http=new Http();
        
            HttpRequest request=new HttpRequest();
        
            HttpResponse response=new HttpResponse();
        
            String url='http://api.openweathermap.org/data/2.5/weather';
            
            
        
            public Double getWeatherInfo(String city){
                url +='?q='+City;
                url +='&APPID='+'9dc95c9470eaef42426a816c64ee0a40&units=metric';
                
                system.debug(url);
                
                request.setMethod('GET');
                request.setEndpoint(url);
                
                
                response=http.send(request);
                Double temprature;
                if(response.getStatusCode() == 200 ){         
                    
                    System.debug('Successfull Receive');
                    
                    Map<String, Object> result= (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
                    
                    Set<String> keys1=result.keySet();               
                            
                    for(String obj:keys1){                    
                        System.debug(obj+'>>'+result.get(obj));
                    }
                    
                    Map<String, Object> temp=(Map<String, Object>)  result.get('main');
                    
                    Set<String> keys=temp.keySet();               
                            
                    for(String obj:keys){                    
                        System.debug(obj+'>>'+temp.get(obj));
                    }
                    temprature = (Double)temp.get('temp');
                    system.debug('temprature'+temprature);
                    system.debug('pressure >>' + temp.get('pressure')+'humidity >> '+temp.get('humidity'));
                    
            }
             
            return temprature;
            
        }
            
    }