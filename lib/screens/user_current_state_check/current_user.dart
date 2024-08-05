import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynoteapp/screens/homeScreen.dart';
import 'package:mynoteapp/screens/auth_ui/login_Screen.dart';

class current_user extends StatefulWidget {
  const current_user({super.key});

  @override
  State<current_user> createState() => _current_userState();
}

class _current_userState extends State<current_user> {
  @override
  void initState() {
    home();
    super.initState();
  }
  home(){
    var user=FirebaseAuth.instance.currentUser;
    if(user==null){
      return log_in_screen();
    }
    else{
      return myHomeScreen();
    }

  }
  @override
  Widget build(BuildContext context) {
    return home();
  }
}
