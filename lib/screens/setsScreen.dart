import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:garden_buddy/settings.dart';
import 'package:numberpicker/numberpicker.dart';

class SetsScreen extends StatefulWidget {
  final Settings sets;

  SetsScreen({Key key,this.sets}):super(key : key);

  @override
  _SetsScreenState createState() => _SetsScreenState();
}

class _SetsScreenState extends State<SetsScreen>{
  int _hour = 12;
  int _min = 0;

  @override
  Widget build(BuildContext context) {
    Settings newSets = widget.sets;
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
                Text("What time would you like to be reminded?",style: TextStyle(fontSize: 18),),
                SizedBox(height: 20),
              Center( //TODO: fix the alignment here
                child: Row(
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(const Size(50, 50)),
                        child: DropdownButton(
                            value: _hour,
                            items: [
                              DropdownMenuItem(
                                child: Text("0"),
                                value: 0,
                              ),
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
                              DropdownMenuItem(
                                child: Text("21"),
                                value: 21,
                              ),
                              DropdownMenuItem(
                                child: Text("22"),
                                value: 22,
                              ),
                              DropdownMenuItem(
                                child: Text("23"),
                                value: 23,
                              ),
                        ],
                          onChanged: (int value) {
                            setState(() {
                              _hour = value;
                            });
                          },
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(const Size(50, 50)),
                        child: Text(" :",style: TextStyle(fontSize: 25)),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(const Size(50, 50)),
                        child: DropdownButton(
                          value: _min,
                          items: [
                            DropdownMenuItem(
                              child: Text("0"),
                              value: 0,
                            ),
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
                            DropdownMenuItem(
                              child: Text("21"),
                              value: 21,
                            ),
                            DropdownMenuItem(
                              child: Text("22"),
                              value: 22,
                            ),
                            DropdownMenuItem(
                              child: Text("23"),
                              value: 23,
                            ),
                            DropdownMenuItem(
                              child: Text("24"),
                              value: 24,
                            ),
                            DropdownMenuItem(
                              child: Text("25"),
                              value: 25,
                            ),
                            DropdownMenuItem(
                              child: Text("26"),
                              value: 26,
                            ),
                            DropdownMenuItem(
                              child: Text("27"),
                              value: 27,
                            ),
                            DropdownMenuItem(
                              child: Text("28"),
                              value: 28,
                            ),
                            DropdownMenuItem(
                              child: Text("29"),
                              value: 29,
                            ),
                            DropdownMenuItem(
                              child: Text("30"),
                              value: 30,
                            ),
                            DropdownMenuItem(
                              child: Text("31"),
                              value: 31,
                            ),
                            DropdownMenuItem(
                              child: Text("32"),
                              value: 32,
                            ),
                            DropdownMenuItem(
                              child: Text("33"),
                              value: 33,
                            ),
                            DropdownMenuItem(
                              child: Text("34"),
                              value: 34,
                            ),
                            DropdownMenuItem(
                              child: Text("35"),
                              value: 35,
                            ),
                            DropdownMenuItem(
                              child: Text("36"),
                              value: 36,
                            ),
                            DropdownMenuItem(
                              child: Text("37"),
                              value: 37,
                            ),
                            DropdownMenuItem(
                              child: Text("38"),
                              value: 38,
                            ),
                            DropdownMenuItem(
                              child: Text("39"),
                              value: 39,
                            ),
                            DropdownMenuItem(
                              child: Text("40"),
                              value: 40,
                            ),
                            DropdownMenuItem(
                              child: Text("41"),
                              value: 41,
                            ),
                            DropdownMenuItem(
                              child: Text("42"),
                              value: 42,
                            ),
                            DropdownMenuItem(
                              child: Text("43"),
                              value: 43,
                            ),
                            DropdownMenuItem(
                              child: Text("44"),
                              value: 44,
                            ),
                            DropdownMenuItem(
                              child: Text("45"),
                              value: 45,
                            ),
                            DropdownMenuItem(
                              child: Text("46"),
                              value: 46,
                            ),
                            DropdownMenuItem(
                              child: Text("47"),
                              value: 47,
                            ),
                            DropdownMenuItem(
                              child: Text("48"),
                              value: 48,
                            ),
                            DropdownMenuItem(
                              child: Text("49"),
                              value: 49,
                            ),
                            DropdownMenuItem(
                              child: Text("50"),
                              value: 50,
                            ),
                            DropdownMenuItem(
                              child: Text("51"),
                              value: 51,
                            ),
                            DropdownMenuItem(
                              child: Text("52"),
                              value: 52,
                            ),
                            DropdownMenuItem(
                              child: Text("53"),
                              value: 53,
                            ),
                            DropdownMenuItem(
                              child: Text("54"),
                              value: 54,
                            ),
                            DropdownMenuItem(
                              child: Text("55"),
                              value: 55,
                            ),
                            DropdownMenuItem(
                              child: Text("56"),
                              value: 56,
                            ),
                            DropdownMenuItem(
                              child: Text("57"),
                              value: 57,
                            ),
                            DropdownMenuItem(
                              child: Text("58"),
                              value: 58,
                            ),
                            DropdownMenuItem(
                              child: Text("59"),
                              value: 59,
                            ),
                          ],
                          onChanged: (int value) {
                            setState(() {
                              _min = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
              ),
                SizedBox(height: 40),
              Text("What city is your garden in?",style: TextStyle(fontSize: 18),),
                SizedBox(height: 20),
              TextFormField(
                initialValue: widget.sets.cityName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                    hintText: "Enter your city"
                  ),
                onChanged: (val) {
                  newSets.setCityName(val);
                }
              ),
                SizedBox(height: 40),
              ElevatedButton(
                child: Text("Save & Exit"),
                onPressed: () => {
                  Navigator.of(context).pop(),
                  newSets.setTimeOfDay(_hour,_min),
                  //TODO: also save newSets
                  SettingsGetter.writeSettings(newSets)
                },
                ),
                SizedBox(height: 20),
                Text("Note: these changes will not take effect until the app restarts"),
              ]
            ),
          )
        ),
    );
  }

}