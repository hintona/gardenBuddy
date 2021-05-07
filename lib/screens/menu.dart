import 'package:flutter/material.dart';
import 'package:garden_buddy/plant.dart';
import 'package:garden_buddy/settings.dart';
import 'package:garden_buddy/weather.dart';

import 'geoScreen.dart';

class SideDrawer extends StatefulWidget {
  final String _time = "12:00pm";
  final List<Plant> plants;


  SideDrawer({Key key,this.plants}):super(key : key);

  WeatherService ws;
  String currentWeather;
  String city;

  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer>{


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
            print(snapshot.error);
            return Text("Uh-oh. Looks like something went wrong");
          }
          else{
            return Column(
              children: <Widget>[
                DrawerHeader(
                  child: Center(
                    child: Text(
                      "At your garden, the current weather is:\n"+widget.currentWeather,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                ),
                Text("Reminder Time: "+widget._time,
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GeoScreen(),
                      ),
                    );
                  },
                ),
                Text("Location: "+widget.city,
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
    widget.ws = WeatherService(city: 'Sarasota');
    widget.currentWeather = await widget.ws.getWeather();
    widget.city = widget.ws.getLoc();
    return true;
  }



}