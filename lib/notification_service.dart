// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await NotificationService().init();
//   runApp(MyApp());
// }
//
// class NotificationService {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   Future<void> init() async {
//     final AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('app_icon');
//
//     var initializationSettingsIOS = DarwinInitializationSettings(
//         requestAlertPermission: true,
//         requestBadgePermission: true,
//         requestSoundPermission: true,
//         onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {});
//
//     final DarwinInitializationSettings initializationSettingsDarwin =
//     DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//       onDidReceiveLocalNotification:
//           (int id, String? title, String? body, String? payload) async {},
//     );
//
//     final InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//       macOS: null,
//       darwin: initializationSettingsDarwin,
//     );
//
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onSelectNotification: selectNotification,
//     );
//   }
//
//
//   Future selectNotification(String payload) async {
//     //Handle notification tapped logic here
//   }
//
//   Future<void> showNotification(
//       int id, String? title, String? body, NotificationDetails? notificationDetails,
//       {String? payload}) async {
//     await flutterLocalNotificationsPlugin.show(
//         id, title, body, notificationDetails, payload: payload);
//   }
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Local Notifications Demo'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Schedule a notification
//             NotificationService().showNotification(
//                 0,
//                 'Test Notification',
//                 'This is a test notification',
//                 const NotificationDetails(
//                     android: AndroidNotificationDetails(
//                         'channel_id', 'channel_name', 'channel_description',
//                         importance: Importance.high,
//                         priority: Priority.high)),
//                 payload: 'Test Payload');
//           },
//           child: Text('Show Notification'),
//         ),
//       ),
//     );
//   }
// }
//
