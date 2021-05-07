import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class GeoScreen extends StatefulWidget {
  @override
  _GeoScreenState createState() => _GeoScreenState();
}

class _GeoScreenState extends State<GeoScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Settings"),
      ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              DateTimePicker(
                type: DateTimePickerType.time,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  hintText: 'Reminder Time'
                ),
                firstDate: DateTime(0),
                lastDate: DateTime(24),
                dateLabelText: 'Reminder Time',
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
                SizedBox(height: 40),
              Text("What city is your garden in?"),
                SizedBox(height: 20),
              TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                    hintText: "Enter your city"
                  ),

              ),
                SizedBox(height: 40),
              ElevatedButton(
                child: Text("Save & Exit"),
                onPressed: () => {Navigator.of(context).pop()},
                ),
              ]
            ),
          )
        ),
    );
  }

}