import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class singleNoteWidget extends StatelessWidget {
  const singleNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.black38,
          border: Border.all(color: Colors.white12),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("My note title",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 18),),
            Text("My note description",style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}
