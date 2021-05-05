import 'package:flutter/material.dart';
import 'package:garden_buddy/plant.dart';
import 'dart:convert';

class CreatePlant extends StatefulWidget {
  final List<Plant> plants;

  CreatePlant({Key key,this.plants}):super(key : key);

  @override
  _CreatePlantState createState() => _CreatePlantState();
}


class _CreatePlantState extends State<CreatePlant> {
  final dateController = TextEditingController();
  int _door = 0;
  int _days = 1;

  String name;
  DateTime newDate;
  bool indoor = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new plant!"),
      ),
      body: Center(
        child: SingleChildScrollView(
         child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
           children: <Widget> [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  hintText: 'Plant name'
              ),
              onChanged: (value){
                name = value;
              }
            ),
             SizedBox(height: 20),
            TextField(
            readOnly: true,
            controller: dateController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                ),
                hintText: 'Planting date'
            ),
            onTap: () async {
            var date =  await showDatePicker(
            context: context,
            initialDate:DateTime.now(),
            firstDate:DateTime(2010),
            lastDate: DateTime.now());
            newDate = date;
            dateController.text = date.toString().substring(0,10);
            print(newDate);
            },
            onChanged: (value) {

            },
            ),
            SizedBox(height: 25),
            Text("How often do you water this plant?"),
            SizedBox(height: 15),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Every     "),
                DropdownButton(
                    value: _days,
                    items: [
                      DropdownMenuItem(
                        child: Text("1"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("2"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text("3"),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text("4"),
                        value: 4,
                      ),
                      DropdownMenuItem(
                        child: Text("5"),
                        value: 5,
                      ),
                      DropdownMenuItem(
                        child: Text("6"),
                        value: 6,
                      ),
                      DropdownMenuItem(
                        child: Text("7"),
                        value: 7,
                      ),
                      DropdownMenuItem(
                        child: Text("8"),
                        value: 8,
                      ),
                      DropdownMenuItem(
                        child: Text("9"),
                        value: 9,
                      ),
                      DropdownMenuItem(
                        child: Text("10"),
                        value: 10,
                      ),
                      DropdownMenuItem(
                        child: Text("11"),
                        value: 11,
                      ),
                      DropdownMenuItem(
                        child: Text("12"),
                        value: 12,
                      ),
                      DropdownMenuItem(
                        child: Text("13"),
                        value: 13,
                      ),
                      DropdownMenuItem(
                        child: Text("14"),
                        value: 14,
                      ),
                      DropdownMenuItem(
                        child: Text("15"),
                        value: 15,
                      ),
                      DropdownMenuItem(
                        child: Text("16"),
                        value: 16,
                      ),
                      DropdownMenuItem(
                        child: Text("17"),
                        value: 17,
                      ),
                      DropdownMenuItem(
                        child: Text("18"),
                        value: 18,
                      ),
                      DropdownMenuItem(
                        child: Text("19"),
                        value: 19,
                      ),
                      DropdownMenuItem(
                        child: Text("20"),
                        value: 20,
                      ),
                    ],
                    onChanged: (int value) {
                      setState(() {
                        _days = value;
                      });
                    },
                ),
                Text("     days"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
              Text("Outdoors"),
              Radio(
                value: 0,
                groupValue: _door,
                onChanged: (int val) {
                  setState(() {
                    _door = val;
                    indoor = false;
                  });
                },
              ),
              Text("Indoors"),
              Radio(
                value: 1,
                groupValue: _door,
                onChanged: (int val) {
                  setState(() {
                    _door = val;
                    indoor = true;
                  });
                },
              ),
              ],
            ),


            ElevatedButton(
              onPressed: () {
                String newContents;
                if(name != null && newDate != null) {
                  Plant newPlant = Plant(name: name,
                      date: newDate,
                      water: _days,
                      lastWater: newDate,
                      indoor: indoor);
                  if(widget.plants == null){
                    List<Plant> plantList = [];
                    plantList.add(newPlant);
                    newContents = jsonEncode(plantList);
                  }
                  else{
                    widget.plants.add(newPlant);
                    newContents = jsonEncode(widget.plants);
                  }
                  JsonWriter(newContents).writeToFile();
                }

                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ]
          ),
      ),
      ),
      ),
    );
  }
}


