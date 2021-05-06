import 'package:flutter/material.dart';
import 'package:garden_buddy/plant.dart';
import 'package:garden_buddy/weather.dart';

import 'geoScreen.dart';

class SideDrawer extends StatelessWidget {
  final String _time = "12:00pm";
  final List<Plant> plants;

  SideDrawer({Key key,this.plants}):super(key : key);

  WeatherService ws;
  String currentWeather;
  String city;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: settingsWidget(),
    );
  }

  Widget settingsWidget(){
    return FutureBuilder(
        future: loadSettings(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          if(!snapshot.hasData && !snapshot.hasError){
            return CircularProgressIndicator();
          }
          if(snapshot.hasError){
            return Text("Uh-oh. Looks like something went wrong");
          }
          else{
            return Column(
              children: <Widget>[
                DrawerHeader(
                  child: Center(
                    child: Text(
                      "At your garden, the current weather is:\n"+currentWeather,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                ),
                Text("Reminder Time: "+_time,
                    style: TextStyle(
                      fontSize: 18,
                    )
                ),
                ListTile(
                  leading: Icon(Icons.access_alarm),
                  title: Text('Change reminder time',
                      style: TextStyle(
                        fontSize: 16,
                      )
                  ),
                  onTap: () => {},
                ),
                Text("Location: "+city,
                    style: TextStyle(
                      fontSize: 18,
                    )
                ),
                ListTile(
                  leading: Icon(Icons.gps_fixed),
                  title: Text('Change location',
                      style: TextStyle(
                        fontSize: 16,
                      )
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GeoScreen(),
                      ),
                    );
                  },
                ),
              ],
            );
          }
        }
    );
  }

  loadSettings() async{
    ws = WeatherService();
    currentWeather = await ws.getWeather();
    city = ws.getLoc();
    return true;
  }



}