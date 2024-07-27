import 'package:flutter/material.dart';
import 'package:mynoteapp/screens/addNoteScreen.dart';
import 'package:mynoteapp/screens/updateNoteScreen.dart';
import 'package:mynoteapp/utils/colors.dart';

import '../controlers/note_controller.dart';
import '../widget/singleNoteWidget.dart';

class myHomeScreen extends StatefulWidget {
  const myHomeScreen({super.key});

  @override
  State<myHomeScreen> createState() => _myHomeScreenState();
}

class _myHomeScreenState extends State<myHomeScreen> {
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: StreamBuilder(
          stream: note_controler.firebase.collection('note').orderBy("DateTime",descending: true).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of items in each row
                ),
                reverse: false,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final data=snapshot.data!.docs[index];
                  return singleNoteWidget(
                    title: snapshot.data!.docs[index].get("Title"),
                    note: data["note"],
                    dateTime: DateTime.now(),
                    id: data.id
                  );
                },
              );
            }
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
