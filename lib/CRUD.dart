import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_components/Pages_cRud.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'Functions/databaseFunctions.dart';

class CRUD extends StatefulWidget {
  const CRUD({Key? key}) : super(key: key);

  @override
  State<CRUD> createState() => _CRUDState();
}

class _CRUDState extends State<CRUD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("CRUD")),
        actions: [IconButton(onPressed: () async {
          await FirebaseAuth.instance.signOut();
        }, icon: Icon(Icons.logout))],
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                create(
                    "Pets",
                    "Cats",
                    "Tina",
                    "Persian",
                    5
                );
              }, child:Text("Create")),
              ElevatedButton(onPressed: (){
                update("Pets", "Dogs", "Name", "Honey");
              }, child:Text("Update")),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Pages_cRud()));
              }, child:Text("Retrive")),
              ElevatedButton(onPressed: (){
                delete("Pets", "Dogs");
              }, child:Text("Delete")),

            ],
          ),
        ),
      ),
    );
  }
}
