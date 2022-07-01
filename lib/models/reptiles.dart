import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final user = FirebaseAuth.instance.currentUser!;

class Reptiles {
  String id;
  final String name;
  final int age;
  final DateTime bday;

  Reptiles({
    this.id = '',
    required this.name,
    required this.age,
    required this.bday,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'bday': bday,
      };

  static Reptiles fromJson(Map<String, dynamic> json) => Reptiles(
        id: json['id'],
        name: json['name'],
        age: json['age'],
        bday: (json['bday'] as Timestamp).toDate(),
      );

  static Future createReptile(Reptiles rep) async {
    final DocumentReference newRep = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('my_rack')
        .doc();
    // final docUser = FirebaseFirestore.instance.collection('users').doc();
    rep.id = newRep.id;

    final json = rep.toJson();
    await newRep.set(json);
  }

  // Stream<List<Reptiles>> readReptiles() => FirebaseFirestore.instance
  //     .collection('users')
  //     .doc(user.uid)
  //     .collection('my_rack')
  //     .snapshots()
  //     .map((snapshot) =>
  //         snapshot.docs.map((doc) => Reptiles.fromJson(doc.data())).toList());

  // Future<Reptiles?> readReptile() async {
  //   /// Get single document by ID
  //   final docReptiles =
  //       FirebaseFirestore.instance.collection('Reptiless').doc('my-id');
  //   final snapshot = await docReptiles.get();

  //   if (snapshot.exists) {
  //     return Reptiles.fromJson(snapshot.data()!);
  //   }
  // }
}
