import 'package:garden_buddy/settings.dart';
import 'package:weather/weather.dart';

class WeatherService{
  final String APIKey = "f0cdf1719b29b1e61b4f76aeae28f0d9";
  final String initCity = "Sarasota";
  WeatherFactory wf;
  String city;

  WeatherService({String city}) {
    this.city = city;
    wf = new WeatherFactory(APIKey);
  }

  Future<double> getRain() async {
    Weather w;
    if(city == null) {
      w = await wf.currentWeatherByCityName(initCity);
    }
    else{ w = await wf.currentWeatherByCityName(city); }
    double rainfall = w.rainLastHour;
    print("from here: "+rainfall.toString());
    return rainfall;
  }

  Future<String> getWeather() async {
    Weather w;
    if(city == null) {
      w = await wf.currentWeatherByCityName(city);
    }
    else{ w = await wf.currentWeatherByCityName(initCity); }
    String weather = w.weatherDescription;
    return weather;
  }

  getLoc() {
    if(city == null) {
      return initCity;
    }
    else{ return city; }
  }

}