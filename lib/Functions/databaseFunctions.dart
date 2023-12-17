import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

create(String colName,docName,Name,Breed,int Age)async{
  await FirebaseFirestore.instance.collection(colName).doc(docName).set({
    'Name' : Name,
    'Breed' : Breed,
    'Age' : Age
  });
  print("Database Updated");
}
update(String colName,docName,field,var NewFieldValue)async{
  await FirebaseFirestore.instance
      .collection(colName)
      .doc(docName)
      .update({field : NewFieldValue});
  print("Fields Updated");
}
delete(String colName,docName)async{
  await FirebaseFirestore.instance
      .collection(colName)
      .doc(docName)
      .delete();
  print("Document Deleted");
}