import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:garden_buddy/plant.dart';

class EditPlant extends StatefulWidget {
  final List<Plant> plants;
  final int num;

  EditPlant({Key key,this.plants,this.num}):super(key:key);

  @override
  _EditPlantState createState() => _EditPlantState();
}

class _EditPlantState extends State<EditPlant> {
  final _dateController = TextEditingController();

  bool _door;
  int _days;



  @override
  Widget build(BuildContext context) {
    _dateController.text = widget.plants[widget.num].date.toString();
    _days = widget.plants[widget.num].water;
    _door = widget.plants[widget.num].indoor;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit your plant"),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                  children: <Widget> [
                    TextFormField(
                      initialValue: widget.plants[widget.num].name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                          ),
                          hintText: 'Plant name'
                      ),
                      onChanged: (val){
                        widget.plants[widget.num].setName(val);
                      },
                    ),
                    SizedBox(height: 20),
                    TextField(
                      readOnly: true,
                      controller: _dateController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                          ),
                          hintText: 'Planting date'
                      ),
                      onTap: () async {
                        var date =  await showDatePicker(
                            context: context,
                            initialDate: widget.plants[widget.num].date,
                            firstDate:DateTime(2010),
                            lastDate: DateTime.now());
                        _dateController.text = date.toString().substring(0,10);
                        widget.plants[widget.num].setDate(DateTime.parse(_dateController.text));
                      },),
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
                              widget.plants[widget.num].setWater(value);
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
                          value: false,
                          groupValue: _door,
                          onChanged: (bool val) {
                            setState(() {
                              _door = val;
                              widget.plants[widget.num].setIndoor(val);
                            });
                          },
                        ),
                        Text("Indoors"),
                        Radio(
                          value: true,
                          groupValue: _door,
                          onChanged: (bool val) {
                            setState(() {
                              _door = val;
                              widget.plants[widget.num].setIndoor(val);
                            });
                          },
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String _changedPlants = jsonEncode(widget.plants);
                        JsonWriter(_changedPlants).writeToFile();
                        Navigator.pop(context);
                      },
                      child: Text('Save changes'),
                    ),
                  ]
              ),
            ),
          ),
        ),
    );
  }
}


