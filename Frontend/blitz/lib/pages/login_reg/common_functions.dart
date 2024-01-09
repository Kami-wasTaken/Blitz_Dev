import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> userExists(
        String username, FirebaseFirestore firestoreInstance) async =>
    (await firestoreInstance
        .collection("Users")
        .where("Username", isEqualTo: username)
        .get()
        .then((value) => value.size > 0 ? true : false));

Future<bool> phoneExists(
        String phoneNumber, FirebaseFirestore firestoreInstance) async =>
    (await firestoreInstance
        .collection("Users")
        .where("PhoneNumber", isEqualTo: phoneNumber)
        .get()
        .then((value) => value.size > 0 ? true : false));
