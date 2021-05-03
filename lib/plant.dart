import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Plant {
  String name; //Holds the name of the plant, in string form
  DateTime date; //Holds plating date, in DateTime form
  int water; //Holds watering frequency, in int form
  DateTime lastWater; //Holds the date it was last watered, DateTime form
  bool indoor; //Holds if plant is indoors, boolean

  Plant({
    @required this.name,
    @required this.date,
    @required this.water,
    @required this.lastWater,
    @required this.indoor
  });

  static Plant fromJson(json) => Plant(
    name: json['name'],
    date: DateTime.parse(json['date']),
    water: json['water'],
    lastWater: DateTime.parse(json['lastWater']),
    indoor: json['indoor'],
  );

  Map toJson() => {
    'name': name,
    'date': date.toString(),
    'water': water,
    'lastWater': lastWater.toString(),
    'indoor': indoor,
  };

  setName(String newName){
    this.name = newName;
  }

  setDate(DateTime newDate){
    this.date = newDate;
  }

  setWater(int newWater){
    this.water = newWater;
  }

  setLastWater(DateTime newLastWater){
    this.lastWater = newLastWater;
  }

  setIndoor(bool newDoor){
    this.indoor = newDoor;
  }

}

class PlantGetter{
  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/plants.json');
  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<String> getFileString() async {
    try{
      final file = await _localFile;
      String contents = await file.readAsString();
      return contents;
    } catch(e) {
      return null;
    }
  }

  static Future<List<Plant>> loadPlants(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await getFileString();
    final form = json.decode(data);
    final list = form.map<Plant>(Plant.fromJson).toList();
    return list;
  }
}

class JsonWriter{
  final String contents;

  JsonWriter(this.contents);

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<String> getFileString() async {
    try{
      final file = await _localFile;
      String contents = await file.readAsString();
      return contents;
    } catch(e) {
      return null;
    }
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/plants.json');
  }


  //Future<File> get _localFile async {
   // return File('lib/assets/plants.json');
  //}

  Future<File> writeToFile() async {
    final file = await _localFile;

    // Write the file.
    return file.writeAsString(contents);
  }



}
