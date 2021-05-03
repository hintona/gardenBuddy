import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:garden_buddy/plant.dart';
import 'package:garden_buddy/plant_edit.dart';

class ViewPlant extends StatefulWidget{
  final List<Plant> plants;
  final int num;
  @override

  ViewPlant({Key key,this.plants,this.num}):super(key:key);

  _ViewPlantState createState() => _ViewPlantState();

}

class _ViewPlantState extends State<ViewPlant> {
  String _door = "outdoors";
  bool value;
  bool val;

  @override
  Widget build(BuildContext context) {
    val = false;
    DateTime last = widget.plants[widget.num].lastWater;
    if(last.day == DateTime.now().day){
      val = true;
    }

    bool value = widget.plants[widget.num].indoor;
    if(value){
      _door = "indoors";
    }
    if(!value){
      _door = "outdoors";
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.plants[widget.num].name),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
              children: <Widget> [
                Text("Plant: "+widget.plants[widget.num].name,
                style: TextStyle(
                fontSize: 20,
                  )
                ),
                SizedBox(height: 20),
                Text("Planting Date: "+ widget.plants[widget.num].date.toString(),
                    style: TextStyle(
                      fontSize: 20,
                    )
                ),
                SizedBox(height: 20),
                Text("Water every "+widget.plants[widget.num].water.toString()+" days",
                    style: TextStyle(
                      fontSize: 20,
                    )
                ),
                SizedBox(height: 20),
                Text("Last Watered:  "+widget.plants[widget.num].lastWater.toString(),
                  style: TextStyle(
                  fontSize: 20,
                  )
                ),
                SizedBox(height: 20),
                Text("Indoors or Outdoors: "+_door.toString(),
                    style: TextStyle(
                      fontSize: 20,
                  )
                ),
                SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Watered Today? : ",
                        style: TextStyle(
                          fontSize: 20,
                        )
                    ),
                    SizedBox(height: 25),
                  Checkbox(
                  value: val,
                  onChanged: (bool value) {
                    setState(() {
                      val = value;
                    });
                    widget.plants[widget.num].setLastWater(DateTime.now());
                    String _changedPlants = jsonEncode(widget.plants);
                    JsonWriter(_changedPlants).writeToFile();
                  },
                ),

                  ]
                ),
                SizedBox(height: 25),

                ElevatedButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditPlant(
                        plants: widget.plants,
                        num: widget.num,
                      )),
                    );
                    setState((){});
                  },
                  child: Text('Edit'),
                ),
                SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () {
                    widget.plants.removeAt(widget.num);
                    String _changedPlants = jsonEncode(widget.plants);
                    JsonWriter(_changedPlants).writeToFile();
                    Navigator.pop(context);
                  },
                  child: Text('Delete plant'),
                ),
              ]
              )
            )
          )
        )
    );
  }
}