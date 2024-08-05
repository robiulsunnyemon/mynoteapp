import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mynoteapp/firebase_auth/firbase_auth.dart';

import 'login_Screen.dart';

class sign_up_screen extends StatefulWidget {
   sign_up_screen({super.key});

  @override
  State<sign_up_screen> createState() => _sign_up_screenState();
}

class _sign_up_screenState extends State<sign_up_screen> {
  final TextEditingController _email_controler=TextEditingController();
  final TextEditingController _password_controler=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
               width: 150,
               height: 150,
                child: Lottie.asset("assets/lottie/lottie.json",fit: BoxFit.cover),
              ),
              SizedBox(height: 50,),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextFormField(
                  controller: _email_controler,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email_outlined),
                    contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextFormField(
                  controller: _password_controler,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: "Password",
                    prefixIcon: Icon(Icons.remove_red_eye_outlined),
                    contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    firebase_auth.sign_up_auth(context,_email_controler.text, _password_controler.text);
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => log_in_screen(),));
                  },
                  child: Text("Signup",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have an account?"),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => log_in_screen(),));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.blue,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
