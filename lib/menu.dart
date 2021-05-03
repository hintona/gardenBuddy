import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  final String _place = "Sarasota";
  final String _time = "12:00pm";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'GardenBuddy Settings',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          Text("Reminder Time: "+_time,
              style: TextStyle(
                fontSize: 18,
              )
          ),
          ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text('Change reminder time',
                style: TextStyle(
                  fontSize: 16,
                )
            ),
            onTap: () => {},
          ),
          Text("Location: "+_place,
          style: TextStyle(
            fontSize: 18,
            )
          ),
          ListTile(
            leading: Icon(Icons.gps_fixed),
            title: Text('Change location',
                style: TextStyle(
                  fontSize: 16,
                )
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}