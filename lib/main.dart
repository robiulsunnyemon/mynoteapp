import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynoteapp/screens/homeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mynoteapp/screens/login_Screen.dart';
import 'firebase_options.dart';
import 'screens/user_current_state_check/current_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Note App',
      theme: ThemeData(),
      home: current_user(),
      debugShowCheckedModeBanner: false,
    );
  }
}
