import 'package:weather/weather.dart';

class WeatherService{
  final String APIKey = "f0cdf1719b29b1e61b4f76aeae28f0d9";
  final String initCity = "Saratoga Springs";
  WeatherFactory wf;
  String city;

  WeatherService(){
    wf = new WeatherFactory(APIKey);
    if(true){
      city = initCity;
    }
  }

  Future<double> getRain() async {
    //here get users selected city
    Weather w = await wf.currentWeatherByCityName(city);
    double rainfall = w.rainLastHour;
    print("from here: "+rainfall.toString());
    return rainfall;
  }

  Future<String> getWeather() async {
    Weather w = await wf.currentWeatherByCityName(city);
    String weather = w.weatherDescription;
    return weather;
  }

  getLoc() {
    return city;
  }


}