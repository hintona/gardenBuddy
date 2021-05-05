import 'package:weather/weather.dart';

class WeatherService{
  final String APIKey = "f0cdf1719b29b1e61b4f76aeae28f0d9";
  final String initCity = "Milwaukee";
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
    double rainfall = w.rainLast3Hours;
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