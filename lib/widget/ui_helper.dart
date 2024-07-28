import 'package:flutter/material.dart';

class ui_helper{
 static show_alart_bottom_sheet(BuildContext context,String text){
    return showModalBottomSheet(context: context, builder: (context) {
       return Container(
         width: double.infinity,
         height: 50,
         child: Center(
           child: Text(
             text
           ),
         ),
       );
      },
      backgroundColor: Colors.white

    );
  }
}