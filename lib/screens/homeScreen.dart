import 'package:flutter/material.dart';
import 'package:mynoteapp/screens/singleNoteScreen.dart';
import 'package:mynoteapp/utils/colors.dart';

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
          child: GridView.builder(
            itemCount: 10,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => singleNoteScreen(),));
                },
                child: singleNoteWidget(),
              );
            },
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.check_box_outlined,color: Colors.white60,size: 25,),
            SizedBox(width: 15,),
            Icon(Icons.draw,color: Colors.white60,size: 25,),
            SizedBox(width: 15,),
            Icon(Icons.mic_none,color: Colors.white60,size: 25,),
            SizedBox(width: 15,),
            Icon(Icons.photo_camera_back,color: Colors.white60,size: 25,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => singleNoteScreen(),));
        },
        child: Icon(Icons.add,size:28,color: Colors.black,),
      ),
    );
  }
}
