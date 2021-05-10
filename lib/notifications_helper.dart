import 'package:flutter_local_notifications/flutter_local_notifications.dart'as notifs;
import 'package:garden_buddy/timezone_helper.dart';
import 'package:rxdart/subjects.dart' as rxSub;
import 'package:timezone/timezone.dart' as tz;

class NotificationClass {
  final int id;
  final String title;
  final String body;
  final String payload;

  NotificationClass({this.id, this.body, this.payload, this.title});
}

  final rxSub.BehaviorSubject<NotificationClass> didReceiveLocalNotificationSubject =
  rxSub.BehaviorSubject<NotificationClass>();

  final rxSub.BehaviorSubject<String> selectNotificationSubject =
  rxSub.BehaviorSubject<String>();


  Future<void> initNotifications( notifs.FlutterLocalNotificationsPlugin notifsPlugin) async {
    var initializationSettingsAndroid = notifs.AndroidInitializationSettings('garden_buddy_icon');

    var initializationSettingsIOS = notifs.IOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
        onDidReceiveLocalNotification:
            (int id, String title, String body, String payload) async {
          didReceiveLocalNotificationSubject
              .add(NotificationClass(id: id, title: title, body: body, payload: payload));
        });

    var initializationSettings = notifs.InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await notifsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
          if (payload != null) {
            print('notification payload: ' + payload);
          }
          selectNotificationSubject.add(payload);
        });

    print("Notifications initialised successfully");
  }


  void requestIOSPermissions( notifs.FlutterLocalNotificationsPlugin notifsPlugin ) {
    notifsPlugin.resolvePlatformSpecificImplementation<notifs.IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }


  Future<void> scheduleNotification(
      {notifs.FlutterLocalNotificationsPlugin notifsPlugin,
        String id,
        String title,
        String body,
        DateTime scheduledTime}) async {
    var androidSpecifics = notifs.AndroidNotificationDetails(
      id, // This specifies the ID of the Notification
      'Scheduled notification', // This specifies the name of the notification channel
      'A scheduled notification', //This specifies the description of the channel
      icon: 'garden_buddy_icon',
    );
    final timeZone = TimeZone();
    String timeZoneName = await timeZone.getTimeZoneName();
    final location = await timeZone.getLocation(timeZoneName);
    final scheduledDate = tz.TZDateTime.from(scheduledTime, location);

    var iOSSpecifics = notifs.IOSNotificationDetails();
    
    var platformChannelSpecifics = notifs.NotificationDetails(
        android: androidSpecifics, iOS: iOSSpecifics);
    print("Notification Scheduled");
    await notifsPlugin.zonedSchedule(0, title, "Scheduled notification",
        scheduledDate, platformChannelSpecifics, androidAllowWhileIdle: true, uiLocalNotificationDateInterpretation: notifs.UILocalNotificationDateInterpretation.absoluteTime); // This literally schedules the notification
  }
  
  
