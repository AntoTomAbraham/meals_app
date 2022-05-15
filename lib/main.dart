import 'package:anto_tom_apk/Screen/Homescreen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: "Anto_Tom_Apk",
      channelName: "successfull",
      channelDescription: "done",
      defaultColor: Colors.green,
      ledColor: Colors.white,
      playSound: false,
      enableLights: false,
      enableVibration: true,
    )
  ]);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anto_Tom_apk',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homescreen(),
    );
  }
}
