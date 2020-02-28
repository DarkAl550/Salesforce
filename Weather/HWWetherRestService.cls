public class HWWetherRestService {
    
    public static void getWetherByCity(String city){
        String key = '57a4fd174eefb041c2fe61083bddeedb';
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.openweathermap.org/data/2.5/weather?q=' + city + '&appid='+ key);
        request.setMethod('GET');
        request.setTimeout(60000);
        
        HttpResponse response = new Http().send(request);
        Weath w = (Weath)JSON.deserialize(response.getBody(), Weath.class);
        
    	//temp
        Double temp = w.main.temp - 273.15; 
        
        //wind
        Double speed = double.valueOf(w.wind.speed) / 3.6;
        Double speedWind = Math.round(speed * 100) / 100.0;
        
        //status
        List<String> status = new List<String>();
        String weth = string.valueOf(w.weather);
        String[] weatherData = weth.Split('[|,|]');
        
        for(Integer i=0; i<weatherData.size(); i++ ){           
           	status.add(weatherData[i]);
        }
	String main;
	String description;        
        for(String st : status){
            if(st.contains('main')){
                String[] weatherStatus = st.Split('=');
               // System.debug(weatherStatus[1]);
                main = weatherStatus[1];
            }
            if(st.contains('description')){
                String[] weatherStatus = st.Split('=');
               // System.debug(weatherStatus[1]);
                description = weatherStatus[1];
            }
            
        }
        
	//execute        
        System.debug('City name: '+ w.name);
        System.debug('Country: ' + w.sys.country);
        System.debug('Weather: [' + main + ', ' + description);
        System.debug('Temperature: ' + temp + '°C');
        System.debug('Wind speed: ' + speedWind + ' m/s');
        System.debug('Humidity: ' + w.main.humidity + '%');
        System.debug('Pressure: ' + w.main.pressure + ' pa');
        
    }
    public class Weath{
        public List<Weather> weather; 
        public String name;
        public Wind wind {get;set;} 
        public Sys sys {get;set;} 
        public Main main {get;set;}
        public Weather weath{get;set;}
    }
    public class Weather{
        public Integer id {get;set;} 
	public String main {get;set;} 
	public String description {get;set;} 		public String icon {get;set;} 
    }
    public class Wind{
        public Integer speed {get;set;} 
	public Integer deg {get;set;} 
	public Integer gust {get;set;} 
    }
    public class Sys{
        public Integer id {get;set;} 
	public String country {get;set;} 
	public Integer sunrise {get;set;} 
	public Integer sunset {get;set;} 
    }
    public class Main{
        public Double temp {get;set;} 
	public Double feels_like {get;set;} 
	public Double temp_min {get;set;} 
	public Double temp_max {get;set;} 
	public Integer pressure {get;set;} 
	public Integer humidity {get;set;} 
    }
    
    
}
