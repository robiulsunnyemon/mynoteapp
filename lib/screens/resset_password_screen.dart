import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mynoteapp/firebase_auth/firbase_auth.dart';


class reset_password_screen extends StatefulWidget {
  reset_password_screen({super.key});

  @override
  State<reset_password_screen> createState() => _reset_password_screenState();
}

class _reset_password_screenState extends State<reset_password_screen> {
  final TextEditingController _email_controler=TextEditingController();

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
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    firebase_auth.reset_password_auth(context, _email_controler.text);
                  },
                  child: Text("Reset",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
