import 'package:flutter/material.dart';
import 'package:mynoteapp/screens/homeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Note App',
      theme: ThemeData(
      ),
      home: myHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

