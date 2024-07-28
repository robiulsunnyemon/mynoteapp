import 'package:flutter/material.dart';
import 'package:mynoteapp/controlers/note_controller.dart';

import '../screens/homeScreen.dart';
import '../utils/colors.dart';

class show_model_sheet_widget extends StatelessWidget {
  final String id;
  const show_model_sheet_widget({super.key, required this.id});

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
          title: Text("Make a copy",style: TextStyle(color: appColors.snackber_color),),
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
