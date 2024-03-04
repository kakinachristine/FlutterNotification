// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:timezone/timezone.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz;
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initNotifications();
//   runApp(MyApp());
// }
//
// Future<void> initNotifications() async {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//   var initializationSettingsAndroid =
//   AndroidInitializationSettings('@mipmap/ic_launcher');
//   var initializationSettingsIOS = DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//       onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {});
//   // var initializationSettingsIOS = IOSInitializationSettings();
//   var initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
// }
//
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     tz.initializeTimeZones();
//
//     scheduleNotification();
//     requestPermissions();
//   }
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   Future<void> requestPermissions() async {
//     await Permission.notification.request();
//   }
//
//   Future<void> scheduleNotification() async {
//     final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       // 'your channel id',
//       'your channel name',
//       'your channel description',
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker',
//     );
//     var iOSPlatformChannelSpecifics = DarwinNotificationDetails();
//     var platformChannelSpecifics = NotificationDetails(
//         android: androidPlatformChannelSpecifics,
//         iOS: iOSPlatformChannelSpecifics);
//
//     // Get the current timezone
//     final location = tz.getLocation('Africa/Nairobi'); // Replace 'Africa/Kenya' with the correct name
//
//     print("location$location");
// // Get the current timezone
// //     final location = tz.getLocation('Africa/Nairobi');
//
//     print("location $location");
//
//     // Convert DateTime object to TZDateTime object
//     final now = TZDateTime.now(location);
//
//     // Add 5 seconds
//     final futureTime = now.add(const Duration(seconds: 5));
//     print("future time $futureTime");
//
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       'scheduled title',
//       'scheduled body',
//       futureTime,
//       platformChannelSpecifics,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//       UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline6,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
