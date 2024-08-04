import 'package:flutter/material.dart';
import 'package:mynoteapp/controlers/note_controller.dart';
import 'package:mynoteapp/model/note_model.dart';

import '../screens/homeScreen.dart';
import '../utils/colors.dart';

class show_bottom_model_sheet_widget extends StatelessWidget {
  final String id;
  final String? title;
  final String? note;
  final String? user_id;
  const show_bottom_model_sheet_widget({super.key, required this.id, this.title, this.note,this.user_id});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: GestureDetector(
            child: Text("Delete",style: TextStyle(color: appColors.snackber_color,),),
            onTap: (){
              note_controler.delete_note(id);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => myHomeScreen(),),);
            },
          ),
          leading: Icon(Icons.delete_outline,color: appColors.snackber_color,),
        ),
        ListTile(
          title: GestureDetector(
              child: Text("Make a copy",style: TextStyle(color: appColors.snackber_color),),
              onTap: (){
                note_controler.add_note(note_model(title: title!, note: note!, dateTime: DateTime.now(), user_id: user_id,));
                Navigator.push(context, MaterialPageRoute(builder: (context) => myHomeScreen(),));
              },
          ),
          leading: Icon(Icons.copy,color: appColors.snackber_color,),
        ),
        ListTile(
          title: Text("Send",style: TextStyle(color: appColors.snackber_color),),
          leading: Icon(Icons.share,color: appColors.snackber_color,),
        ),
        ListTile(
          title: Text("Collaborator",style: TextStyle(color: appColors.snackber_color),),
          leading: Icon(Icons.person,color: appColors.snackber_color,),
        ),
        ListTile(
          title: Text("Labels",style: TextStyle(color: appColors.snackber_color),),
          leading: Icon(Icons.label,color: appColors.snackber_color,),
        ),
        ListTile(
          title: Text("Helps & feedback",style: TextStyle(color: appColors.snackber_color),),
          leading: Icon(Icons.help_outline,color: appColors.snackber_color,),
        ),
      ],

    );
  }
}
