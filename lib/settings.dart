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
    this.hour,
    this.min
  });

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


