import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynoteapp/screens/auth_ui/login_Screen.dart';
import 'package:mynoteapp/widget/ui_helper.dart';

import '../screens/homeScreen.dart';

class firebase_auth {
  static final firebase=FirebaseAuth.instance;
  static sign_in_auth(BuildContext context, String email, String password) async {
    if (email == "" && password == "") {
      ui_helper.show_alart_bottom_sheet(context, "Email and Password Can't be Null");
    } else if (email == "" || password == "") {
      ui_helper.show_alart_bottom_sheet(context, "Email and Password Can't be Null");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((valu) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => myHomeScreen(),
              ));
        });
      } on FirebaseException catch (ex) {
        print("Exception is ${ex}");
      }
    }
  }

  static sign_up_auth(
      BuildContext context, String email, String password) async {
    if (email == "" && password == "") {
      ui_helper.show_alart_bottom_sheet(context, "Email and Password Can't be Null");
    } else if (email == "" || password == "") {
      ui_helper.show_alart_bottom_sheet(context, "Email and Password Can't be Null");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
              firebase.signOut();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => log_in_screen(),
              ));
        });
      } on FirebaseException catch (ex) {
        print("Exception is ${ex.message}");
      }
    }
  }

  static reset_password_auth(BuildContext context, String email) async {
    if (email == "") {
      ui_helper.show_alart_bottom_sheet(context, "Email Can't be Null");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .sendPasswordResetEmail(email: email)
            .then((value) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => log_in_screen(),
              ));
        });
      } on FirebaseException catch (ex) {
        print("Exception is ${ex.message}");
      }
    }
  }

  static log_out_auth(BuildContext context) async {
    UserCredential? usercredential;
    try {
      usercredential = await FirebaseAuth.instance.signOut().then((value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => log_in_screen(),
            ));
      });
    } on FirebaseException catch (ex) {
      print("Exception is ${ex.message}");
    }
  }
}
