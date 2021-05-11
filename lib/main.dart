import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:garden_buddy/settings.dart';
import 'notifications_helper.dart';
import 'screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Settings sets;
  try {
    sets = await SettingsGetter.loadSettings();
  } catch (e){
    sets = Settings();
    print("Defaulted\nERROR "+e.toString());
  }

  NotificationAppLaunchDetails notifLaunch;
  final FlutterLocalNotificationsPlugin notifsPlugin = FlutterLocalNotificationsPlugin();
  notifLaunch = await notifsPlugin.getNotificationAppLaunchDetails();
  await initNotifications(notifsPlugin);
  requestIOSPermissions(notifsPlugin);
  scheduleNotification(notifsPlugin: notifsPlugin, id: DateTime.now().toString(), body: "You should water your plants",scheduledTime: sets.getTime());

  runApp(MyApp(sets: sets));
}

class MyApp extends StatelessWidget {
  final Settings sets;

  MyApp({this.sets});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GardenBuddy',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'GardenBuddy',sets: sets),
    );
  }
}



