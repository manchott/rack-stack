import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String id;
  final String email;

  Users({
    required this.id,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
      };

  static Users fromJson(Map<String, dynamic> json) => Users(
        id: json['id'],
        email: json['email'],
      );

  static Future<String> createUser(Users newUser) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(newUser.id)
          .set({'id': newUser.id, 'email': newUser.email});
    } catch (e) {
      print(e);
    }
    return "create";
  }
}
