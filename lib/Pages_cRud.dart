import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class Pages_cRud extends StatefulWidget {
  const Pages_cRud({Key? key}) : super(key: key);

  @override
  State<Pages_cRud> createState() => _Pages_cRudState();
}

class _Pages_cRudState extends State<Pages_cRud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("My Pets")),
        actions: [IconButton(onPressed: () async {
          await FirebaseAuth.instance.signOut();
        }, icon: Icon(Icons.logout))],
      ),
      body:Container(
        margin: EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection("Pets").snapshots(),
        builder: (context,petSnapshot){
          if(petSnapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            final PetDocs= petSnapshot.data!.docs;
            return ListView.builder(
              itemCount: PetDocs.length,
                itemBuilder: (context,index){
              return Card(
                elevation: 10,
                child: ListTile(
                  title: Text(PetDocs[index]['Name']),
                  subtitle: Text(PetDocs[index]['Breed']),
                  trailing: Text(PetDocs[index]['Age'].toString()),
                ),
              );
            });
          }
        },),
      ),
    );
  }
}
