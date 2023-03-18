import 'package:flutter/cupertino.dart';

class UserModel with ChangeNotifier {
  String? userName;
  String? userEmail;
  String? userImage;
  String? userId;
  UserModel({
    this.userEmail,
    this.userId,
    this.userImage,
    this.userName,
  });
}
