import 'package:flutter/material.dart';
import 'package:mynoteapp/controlers/note_controller.dart';
import 'package:mynoteapp/model/note_model.dart';
import 'package:mynoteapp/screens/homeScreen.dart';
import 'package:mynoteapp/utils/colors.dart';

class updateNoteScreen extends StatelessWidget {
  final String title;
  final String note;
  final DateTime dateTime;
  final String id;
  updateNoteScreen(
      {super.key,
      required this.title,
      required this.note,
      required this.dateTime,
      required this.id});

  @override
  Widget build(BuildContext context) {
    TextEditingController title_TEcontroller =
        TextEditingController(text: title);
    TextEditingController note_TEcontroller = TextEditingController(text: note);
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
                    hintText: title,
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
                    hintText: note,
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
                "3.5",
                style: TextStyle(
                    color: Colors.white60,
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                child: Icon(
                  Icons.more_vert,
                  color: Colors.white60,
                  size: 25,
                ),
                onTap: () {
                  // showDialog(
                  //   context: context,
                  //   builder: (context) {
                  //     return AlertDialog(
                  //       title: Column(
                  //         children: [
                  //           ListTile(
                  //             title: GestureDetector(
                  //               child: Text("Delete"),
                  //               onTap: (){
                  //                 note_controler.delete_note(id);
                  //                 Navigator.push(context, MaterialPageRoute(builder: (context) => myHomeScreen(),));
                  //               },
                  //             ),
                  //             leading: Icon(Icons.delete),
                  //           ),
                  //           ListTile(
                  //             title: Text("Make a copy"),
                  //             leading: Icon(Icons.copy),
                  //           ),
                  //           ListTile(
                  //             title: Text("Send"),
                  //             leading: Icon(Icons.share),
                  //           ),
                  //           ListTile(
                  //             title: Text("Collaborator"),
                  //             leading: Icon(Icons.person),
                  //           ),
                  //           ListTile(
                  //             title: Text("Labels"),
                  //             leading: Icon(Icons.label),
                  //           ),
                  //           ListTile(
                  //             title: Text("Helps & feedback"),
                  //             leading: Icon(Icons.help_outline),
                  //           ),
                  //         ],
                  //       ),
                  //       backgroundColor: Colors.white,
                  //       alignment: Alignment.bottomLeft,
                  //     );
                  //   },
                  //
                  // );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Column(
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

                        ),
                    )
                  );

                },
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
                  note_controler.update_note(
                    id,
                    note_model(
                      title: title_TEcontroller.text,
                      note: note_TEcontroller.text,
                      dateTime: DateTime.now(),
                    ),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => myHomeScreen(),
                    ),
                  );
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