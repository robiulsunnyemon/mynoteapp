import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynoteapp/screens/login_Screen.dart';
import 'package:mynoteapp/screens/resset_password_screen.dart';

import '../screens/homeScreen.dart';

class firebase_auth{

  static sign_in_auth(BuildContext context,String email,String password)async{
    if(email=="" && password==""){
      print("email and password null");
    }
    else if (email=="" || password==""){
      print("email and password null");
    }
    else{
      UserCredential? usercredential;
      try{
        usercredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((valu){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => myHomeScreen(),));
        });
      }on FirebaseException catch(ex){
        print("Exception is ${ex}");
      }
    }
  }

  static sign_up_auth(BuildContext context,String email,String password)async{
    if(email=="" && password==""){
      print("email and password null");
    }
    else if (email=="" || password==""){
      print("email and password null");
    }
    else{
      UserCredential? usercredential;
      try{
        usercredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => myHomeScreen(),));
        });
      }on FirebaseException catch(ex){
        print("Exception is ${ex.message}");
      }
    }
  }

  static reset_password_auth(BuildContext context,String email)async{
    if(email==""){
      print("email and password null");
    }
    else{
      UserCredential? usercredential;
      try{
        usercredential=await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value){});
      }on FirebaseException catch(ex){
        print("Exception is ${ex.message}");
      }
    }
  }

  static log_out_auth(BuildContext context)async{

    UserCredential? usercredential;
    try{
    usercredential=await FirebaseAuth.instance.signOut().then((value){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => log_in_screen(),));
    });
    }on FirebaseException catch(ex){
    print("Exception is ${ex.message}");
    }
  }


}