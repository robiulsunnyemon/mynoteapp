import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mynoteapp/model/note_model.dart';

class note_controler {
  static final firebase = FirebaseFirestore.instance;
  static final collection_name="data";






  static add_note(note_model Note_model,) {
    firebase.collection(collection_name).add({
      'Title': Note_model.title,
      'note': Note_model.note,
      'DateTime': Note_model.dateTime,
      'uid': Note_model.user_id
    });
  }

  static update_note(String id,note_model Note_model) {
    firebase.collection(collection_name).doc(id).update({
      'Title': Note_model.title,
      'note': Note_model.note,
      'DateTime': Note_model.dateTime,
      'uid': Note_model.user_id
    });
  }


  static delete_note(String id) {
    firebase.collection(collection_name).doc(id).delete();
  }


}
