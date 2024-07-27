import 'package:flutter/material.dart';
import 'package:mynoteapp/controlers/note_controller.dart';
import 'package:mynoteapp/model/note_model.dart';
import 'package:mynoteapp/screens/homeScreen.dart';
import 'package:mynoteapp/utils/colors.dart';

class singleNoteScreen extends StatelessWidget {
  singleNoteScreen({super.key});

  @override
  TextEditingController title_TEcontroller = TextEditingController();
  TextEditingController note_TEcontroller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.scafold_background,
      appBar: AppBar(
        actions: [
          Icon(Icons.notifications_active),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.notifications_active),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.notifications_active),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            TextFormField(
                controller: title_TEcontroller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title",
                    hintStyle: TextStyle(
                        color: Colors.white60,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            TextFormField(
                controller: note_TEcontroller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Note",
                    hintStyle: TextStyle(
                        color: Colors.white60,
                        fontSize: 17,
                        fontWeight: FontWeight.w700)),
                style: TextStyle(
                    color: Colors.white60,
                    fontSize: 17,
                    fontWeight: FontWeight.w700)),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 25,
              ),
              Container(
                child: Icon(
                  Icons.add,
                  color: Colors.white60,
                  size: 20,
                ),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white60)),
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.color_lens_outlined,
                color: Colors.white60,
                size: 25,
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.legend_toggle,
                color: Colors.white60,
                size: 25,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "5.34 AM",
                style: TextStyle(
                    color: Colors.white60,
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.more_vert,
                color: Colors.white60,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                child: Icon(
                  Icons.add_task_outlined,
                  color: Colors.white60,
                  size: 25,
                ),
                onTap: () {
                  note_controler.add_note(
                    note_model(
                        title: title_TEcontroller.text,
                        note: note_TEcontroller.text,
                        dateTime: DateTime.now(),
                    ),
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) => myHomeScreen(),));
                  
                },
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
