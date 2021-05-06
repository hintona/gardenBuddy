import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'package:google_api_headers/google_api_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

const kGoogleApiKey = "AIzaSyCRi9pl0B0bxUeDzZbmHkuJv6nZDjisGI4";

class GeoScreen extends StatefulWidget {
  @override
  _GeoScreenState createState() => _GeoScreenState();
}

class _GeoScreenState extends State<GeoScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set location"),
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            ElevatedButton(
              child: Text("Save & Exit"),
              onPressed: () => {Navigator.of(context).pop()},
              ),
            ]
          )
        ),
    );
  }

}