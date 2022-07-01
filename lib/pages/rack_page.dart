import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/reptiles.dart';

class RackPage extends StatefulWidget {
  @override
  _RackPageState createState() => _RackPageState();
}

class _RackPageState extends State<RackPage> {
  final controller = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('All Reps'),
        ),
        body: buildReps(),
        // body: buildSingleUser(),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.add),
        //   onPressed: () {
        //     Navigator.of(context).push(MaterialPageRoute(
        //       builder: (context) => UserPage(),
        //     ));
        //   },
        // ),
      );

  Widget buildReps() => StreamBuilder<List<Reptiles>>(
      stream: readReptiles(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong! ${snapshot.error}');
        } else if (snapshot.hasData) {
          final users = snapshot.data!;

          return ListView(
            children: users.map(buildRep).toList(),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });

  // Widget buildSingleUser() => FutureBuilder<Reptiles?>(
  //       future: readReptiles(),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasError) {
  //           return Text('Something went wrong! ${snapshot.error}');
  //         } else if (snapshot.hasData) {
  //           final rep = snapshot.data;

  //           return rep == null
  //               ? Center(child: Text('No User'))
  //               : buildRep(rep);
  //         } else {
  //           return Center(child: CircularProgressIndicator());
  //         }
  //       },
  //     );

  Widget buildRep(Reptiles rep) => ListTile(
        leading: CircleAvatar(child: Text('${rep.age}')),
        title: Text(rep.name),
        subtitle: Text(rep.bday.toIso8601String()),
      );

  Stream<List<Reptiles>> readReptiles() => FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('my_rack')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map<Reptiles>((doc) => Reptiles.fromJson(doc.data()))
          .toList());

  // Future<User?> readUser() async {
  //   /// Get single document by ID
  //   final docUser = FirebaseFirestore.instance.collection('users').doc('my-id');
  //   final snapshot = await docUser.get();

  //   if (snapshot.exists) {
  //     return User.fromJson(snapshot.data()!);
  //   }
  // }

  // Future createUser({required String name}) async {
  //   /// Reference to document
  //   final docUser = FirebaseFirestore.instance.collection('users').doc();

  //   final json = {
  //     'id': docUser.id,
  //     'name': name,
  //     'age': 21,
  //     'birthday': DateTime(2001, 7, 28),
  //   };

  //   /// Create document and write data to Firebase
  //   await docUser.set(json);
  // }
}
