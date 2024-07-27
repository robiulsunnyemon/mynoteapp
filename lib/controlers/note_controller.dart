import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mynoteapp/model/note_model.dart';

class note_controler extends GetxController {
  static final firebase = FirebaseFirestore.instance;

  static add_note(note_model Note_model) {
    firebase.collection("note").add({
      'Title': Note_model.title,
      'note': Note_model.note,
      'DateTime': Note_model.dateTime,
    });
  }

  static update_note(String id,note_model Note_model) {
    firebase.collection("note").doc(id).update({
      'Title': Note_model.title,
      'note': Note_model.note,
      'DateTime': Note_model.dateTime,
    });
  }


  static delete_note(String id) {
    firebase.collection("note").doc(id).delete();
  }


}
