import 'package:garden_buddy/settings.dart';
import 'package:weather/weather.dart';

class WeatherService{
  final String APIKey = "4dcccccbe1096b1d994947a1244d7562";
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
