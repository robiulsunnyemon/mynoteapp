
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../controlers/note_controller.dart';
import '../firebase_auth/firbase_auth.dart';
import '../widget/singleNoteWidget.dart';
import 'addNoteScreen.dart';

class myHomeScreen extends StatefulWidget {
  const myHomeScreen({super.key});

  @override
  State<myHomeScreen> createState() => _myHomeScreenState();
}


class _myHomeScreenState extends State<myHomeScreen> {

  @override
  void initState() {
    user_id;
    super.initState();
  }

  final user_id=FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        title: Text(
          "MY NOTES",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white70,
        elevation: 0,
        actions: [
          GestureDetector(
            child: Icon(Icons.login_outlined),
            onTap: (){
              firebase_auth.log_out_auth(context);
            },
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection(note_controler.collection_name).where("uid",isEqualTo:user_id).orderBy("DateTime",descending: true).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return GridView.builder(
                primary: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of items in each row
                ),
                reverse: false,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final data=snapshot.data!.docs[index];
                  return singleNoteWidget(
                    title: data["Title"],
                    note: data["note"],
                    dateTime: DateTime.now()!,
                    user_id: user_id,
                    id: data.id
                  );
                },
              );
            }
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: Container(),
              decoration: BoxDecoration(
              )
            ),
            ListTile(
              title: Text("N O T E S"),
              leading: GestureDetector(
                  child: Icon(Icons.home_filled),
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => myHomeScreen(),));
                  },
              ),
            ),
            SizedBox(height: 15,),
            ListTile(
              title: Text("P R O F I L E"),
              leading: Icon(Icons.person),
            ),
            SizedBox(height: 15,),
            ListTile(
              title: Text("L O G O U T"),
              leading: Icon(Icons.logout_outlined),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.check_box_outlined,
              color: Colors.white60,
              size: 25,
            ),
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.draw,
              color: Colors.white60,
              size: 25,
            ),
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.mic_none,
              color: Colors.white60,
              size: 25,
            ),
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.photo_camera_back,
              color: Colors.white60,
              size: 25,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => singleNoteScreen(),
              ));
        },
        child: Icon(
          Icons.add,
          size: 28,
          color: Colors.black,
        ),
      ),
    );
  }
}

