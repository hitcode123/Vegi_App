import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vegi_app/Models/user_model.dart';

class UserProvider with ChangeNotifier {
  void addUserData(
      {User? currentUser,
      String? userName,
      String? userImage,
      String? userEmail}) async {
    await FirebaseFirestore.instance
        .collection("UserData")
        .doc(currentUser!.uid)
        .set({
      "userName": userName,
      "userImage": userImage,
      "userEmail": userEmail,
      "userUid": currentUser.uid
    });
    UserModel userModel;
  void getUserData() async {
    DocumentSnapshot getuserdata= await FirebaseFirestore.instance
        .collection("UserData")
        .doc().get();
        userModel=UserModel(userEmail: getuserdata.get(""))


    
  }
}
