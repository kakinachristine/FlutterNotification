import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initNotifications();
  runApp(MyApp());
}

Future<void> initNotifications() async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {});
  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  // late AudioPlayer audioPlayer;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    // Initialize audio player
    // audioPlayer = AudioPlayer();

    // Initialize local notifications plugin
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // Call method to request permissions and play sound
    requestPermissionsAndPlaySound();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<void> requestPermissionsAndPlaySound() async {
    // Request notification permission
    await Permission.notification.request();

    // Play the sound
    // await playSound();

    // Show the notification
    await showNotification();
  }

  // Future<void> playSound() async {
  //   // Play the audio file
  //   int result =
  //   await audioPlayer.play('assets/audio/your_audio_file.mp3', isLocal: true);
  //   if (result == 1) {
  //     print('Audio played successfully');
  //   } else {
  //     print('Error playing audio');
  //   }
  // }

  Future<void> showNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your channel name',
      'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    var iOSPlatformChannelSpecifics = DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    // Show the notification immediately
    await flutterLocalNotificationsPlugin.show(
      0,
      'Notification Title',
      'Notification Body',
      platformChannelSpecifics,
      payload: 'notification payload',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
