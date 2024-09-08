import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String? name;
  String? email;
  String? password;
  String? mobileNumber;
  ImageProvider? userImage;

  void updateUser(String newName, String newEmail, String newPassword,
      String newMobile, ImageProvider newImage) {
    name = newName;
    email = newEmail;
    password = newPassword;
    mobileNumber = newMobile;
    userImage = newImage;
    notifyListeners();
  }
}
