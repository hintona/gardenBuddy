import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Settings {
  String cityName;
  DateTime time;

  Settings({
    @required this.cityName,
    @required this.time,
  });

  static Settings fromJson(json) => Settings(
    cityName: json['cityName'],
    time: json['time']
  );

  Map toJson() => {
    'cityName': cityName,
    'time': time,
  };

  setCityName(String newName){
    this.cityName = newName;
  }

  setTime(DateTime newTime){
    this.time = newTime;
  }

  setTimeOfDay(int hour, int minute){
    DateTime newTime = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,hour,minute);
    this.time = newTime;
  }
}


