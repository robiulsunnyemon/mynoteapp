import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynoteapp/screens/check_user.dart';
import 'package:mynoteapp/screens/homeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mynoteapp/screens/login_Screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Note App',
      theme: ThemeData(
      ),
      home: log_in_screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

