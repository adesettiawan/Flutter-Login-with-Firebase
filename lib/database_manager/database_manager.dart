import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseManager {
  final CollectionReference profileUser =
      Firestore.instance.collection('profile');

  Future<void> createUserData(
      String name, String phoneNumber, String uid) async {
    return await profileUser.document(uid).setData({
      'name': name,
      'phoneNumber': phoneNumber,
    });
  }
}
