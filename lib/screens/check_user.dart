import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynoteapp/screens/homeScreen.dart';
import 'package:mynoteapp/screens/login_Screen.dart';

class check_user extends StatelessWidget {
  const check_user({super.key});



  @override
  Widget build(BuildContext context) {
    return check_user();

  }
  check_user_state() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return log_in_screen();
    }
    else {
      return myHomeScreen();
    }
  }
}
