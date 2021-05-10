import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'notifications_helper.dart';
import 'screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationAppLaunchDetails notifLaunch;
  final FlutterLocalNotificationsPlugin notifsPlugin = FlutterLocalNotificationsPlugin();
  notifLaunch = await notifsPlugin.getNotificationAppLaunchDetails();
  await initNotifications(notifsPlugin);
  requestIOSPermissions(notifsPlugin);
  scheduleNotification(notifsPlugin: notifsPlugin, id: DateTime.now().toString(), body: "A scheduled Notification",scheduledTime: DateTime.now().add(Duration(seconds:10)));
  runApp(MyApp(notifsPlugin: notifsPlugin));
}

class MyApp extends StatelessWidget {
  final FlutterLocalNotificationsPlugin notifsPlugin;

  MyApp({this.notifsPlugin});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GardenBuddy',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'GardenBuddy',notifsPlugin: notifsPlugin),
    );
  }
}



