import 'package:flutter/material.dart';
import 'package:garden_buddy/plant.dart';
import 'package:garden_buddy/settings.dart';
import 'package:garden_buddy/weather.dart';

import 'setsScreen.dart';

class SideDrawer extends StatefulWidget {
  final List<Plant> plants;
  final Settings sets;


  SideDrawer({Key key,this.plants,this.sets}):super(key : key);

  WeatherService ws;
  String currentWeather;

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
        future: loadSettings(widget.sets.cityName),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          if(!snapshot.hasData && !snapshot.hasError){
            return Center(child:CircularProgressIndicator());
          }
          if(snapshot.hasError){
            print(snapshot.error);
            return Center(child:Text("Uh-oh. Looks like something went wrong"));
          }
          else{
            String mins = widget.sets.getTime().minute.toString();
            if(widget.sets.getTime().minute < 10) mins = "0"+widget.sets.getTime().minute.toString();
            String time = widget.sets.getTime().hour.toString()+":"+mins;
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
                Text("Reminder Time: "+time,
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
                        builder: (context) => SetsScreen(
                          sets: widget.sets,
                        ),
                      ),
                    );
                  },
                ),
                Text("Location: "+widget.sets.cityName,
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
                        builder: (context) => SetsScreen(
                          sets: widget.sets,
                        ),
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

  loadSettings(String cityName) async{
    widget.ws = WeatherService(city: cityName);
    widget.currentWeather = await widget.ws.getWeather();
    return true;
  }

}