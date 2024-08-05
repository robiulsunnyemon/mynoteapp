import 'package:flutter/material.dart';
import 'package:mynoteapp/controlers/note_controller.dart';
import 'package:mynoteapp/model/note_model.dart';
import 'package:mynoteapp/screens/homeScreen.dart';
import 'package:mynoteapp/utils/colors.dart';
import 'package:mynoteapp/widget/show_model_sheet_widget.dart';

class updateNoteScreen extends StatelessWidget {
  final String title;
  final String note;
  final DateTime dateTime;
  final String id;
  final user_id;
  updateNoteScreen(
      {super.key,
      required this.title,
      required this.note,
      required this.dateTime,
      required this.user_id,
      required this.id});

  @override
  Widget build(BuildContext context) {
    TextEditingController title_TEcontroller = TextEditingController(text: title);
    TextEditingController note_TEcontroller = TextEditingController(text: note);
    return Scaffold(
      backgroundColor: appColors.scafold_background,
      appBar: AppBar(
        backgroundColor: appColors.headerBackground,
        actions: [
          Icon(Icons.push_pin_outlined),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.notifications_active_outlined),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.archive_outlined),
          SizedBox(
            width: 20,
          )
        ],
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios_new_outlined),
          onTap: (){
            Navigator.pop(context);
          },
        ),
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
                        color: appColors.textformfeild_hints_color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                style: TextStyle(
                    color: appColors.single_notes_widget_title_color,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            TextFormField(
                controller: note_TEcontroller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: note,
                    hintStyle: TextStyle(
                        color: appColors.textformfeild_hints_color,
                        fontSize: 17,
                        fontWeight: FontWeight.w700)),
                style: TextStyle(
                    color: appColors.single_notes_widget_note_color,
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
                  color: appColors.icon_color,
                  size: 20,
                ),
                decoration:
                    BoxDecoration(border: Border.all(color: appColors.border_color,)),
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.color_lens_outlined,
                color: appColors.icon_color,
                size: 25,
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.legend_toggle,
                color: appColors.icon_color,
                size: 25,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "3.5",
                style: TextStyle(
                    color: appColors.icon_color,
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                child: Icon(
                  Icons.more_vert,
                  color: appColors.icon_color,
                  size: 25,
                ),
                onTap: () {

                  showModalBottomSheet(
                    context: context,
                    backgroundColor: appColors.bottom_sheet_background_color,
                    builder: (context) {
                        return  Container(
                          height: 336,
                          width: double.infinity,
                          color: appColors.bottom_sheet_background_color,
                          child: show_bottom_model_sheet_widget(id: id,title: title_TEcontroller.text,note: note_TEcontroller.text,user_id: user_id,),
                        );

                      },
                  );
                },
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                child: Icon(
                  Icons.add_task_outlined,
                  color: appColors.icon_color,
                ),
                onTap: () {
                  note_controler.update_note(
                      id, note_model(
                      title: title_TEcontroller.text,
                      note: note_TEcontroller.text,
                      dateTime:DateTime.now(),
                      user_id: user_id,
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
