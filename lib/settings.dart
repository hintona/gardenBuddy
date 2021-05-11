import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Settings {
  String cityName;
  int hour;
  int min;

  Settings({
    this.cityName = 'Sarasota',
    this.hour = 12,
    this.min = 15
  });

  /*factory Settings.fromJson(Map<String, dynamic> parsedJson) {
    return Settings(
      cityName: parsedJson['cityName'],
      hour: parsedJson['hour'],
      min: parsedJson['min']
    );
  }*/

  static Settings fromJson(json) => Settings(
    cityName: json['cityName'],
    hour: json['hour'],
    min: json['min']
  );

  Map toJson() => {
    'cityName': cityName,
    'hour': hour,
    'min': min
  };

  setCityName(String newName){
    this.cityName = newName;
  }

  setTimeOfDay(int newHr, int newMn){
    hour = newHr;
    min = newMn;
  }

  DateTime getTime(){
    if(hour == null) hour = 12;
    if(min == null) min = 0;
    DateTime newTime = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,hour,min);
    return newTime;
  }

  checkSettings(){
    if(cityName == null){
      this.setCityName('Sarasota');
    }
    if(hour == null) hour = 12;
    if(min == null) min = 0;
  }

}

class SettingsGetter{
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/settings.json');
  }

  static Future<String> _getFileString() async {
    try{
      final file = await _localFile;
      String contents = await file.readAsString();
      return contents;
    } catch(e) {
      return null;
    }
  }

  static Future<Settings> loadSettings() async {
    final data = await _getFileString();
    print("this0");
    print(data);
    final form = json.decode(data);
    print("this1");
    final Settings sets = Settings.fromJson(form);
    return sets;
  }

  static Future<File> writeSettings(Settings sets) async {
    final file = await _localFile;
    var data = jsonEncode(sets);
    return file.writeAsString(data.toString());
  }

}


