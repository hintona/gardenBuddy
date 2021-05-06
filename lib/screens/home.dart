import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:garden_buddy/plant.dart';
import 'package:garden_buddy/screens/plant_view.dart';
import 'create_plant.dart';
import 'menu.dart';

//TODO: Have daily notifications saying what needs watering
//TODO: allow user to pick the time of their notifications
//TODO: set icon of app
//TODO: allow user to store location in settings file

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Plant> plantList;
  int index;
  double rain = 20.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: SideDrawer(
        plants: plantList,
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:plantTiles(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreatePlant(
                plants: plantList,
              )),
            );
            setState((){});
          },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget plantTiles(){

    return FutureBuilder(
      future: load(),
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        if(!snapshot.hasData && !snapshot.hasError){
          return CircularProgressIndicator();
        }
        if(snapshot.hasError && plantList != null && plantList.length != 0){
          return Text("An error has occurred:\n" + snapshot.error.toString());
        }
        if(plantList == null || plantList.length == 0){
          return Text("Hey! Looks like you don't have any plants yet. \n"+
          "Why don't you tap on the + in the bottom right corner and add some?");
        }
        else{
          index = plantList.length;
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: index,
              itemBuilder: (context, index){
                return Card(
                  child: ListTile(
                    title:Text(plantList[index].name),
                    subtitle:Text("Should be watered "+waterMessage(plantList[index].lastWater,plantList[index].water)),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewPlant(
                          plants: plantList,
                          num: index,
                        )),
                      );
                      setState(() {

                      });
                    },
                  )
                );
              }
           );
        }
      }
    );
  }

  Future load() async{
    List<Plant> plants = await PlantGetter.loadPlants(context);
    plantList = plants;
    markPlants();
    return plants;
  }

  String waterMessage(DateTime day,int num){
    Duration diff = DateTime.now().difference(day);
    if(diff.inDays < num){
      String msg = "in "+ (num-diff.inDays).toString() + " days.";
      return msg;
    }
    else return "today!";
  }

  markPlants() async{
    if(1.50 <= rain){
      for(int i = 0;i < plantList.length; i++){
        if(!plantList[i].indoor){
          print(plantList[i].name+" watered");
          plantList[i].setLastWater(DateTime.now());
          String _changedPlants = jsonEncode(plantList);
          JsonWriter(_changedPlants).writeToFile();
        }
      }
    }
  }
}

