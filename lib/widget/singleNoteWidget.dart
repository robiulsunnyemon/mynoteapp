import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynoteapp/screens/updateNoteScreen.dart';

class singleNoteWidget extends StatelessWidget {
  final String title;
  final String note;
  final DateTime dateTime;
  final String id;
  final  user_id;
  const singleNoteWidget(
      {super.key,
      required this.title,
      required this.note,
      required this.dateTime,
      required this.user_id,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                updateNoteScreen(
                    title: title,
                    note: note,
                    dateTime: dateTime,
                    user_id: user_id,
                    id: id,
                ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.black38,
            border: Border.all(color: Colors.white12),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${title}",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 18),
              ),
              Text(
                note,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
