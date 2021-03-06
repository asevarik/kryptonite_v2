import 'package:flutter/material.dart';

class PasswordData extends ChangeNotifier {
  final String email = '';
  final String masterPassword = '';
  final bool isUserPwned = false;
  final bool useCloudSync = false;
  final bool usedGoogleSignin = false;

  List<Map<String, dynamic>> passwordEntries = [
    {
      "id": 0,
      "websiteNickname": "Netflix",
      "entryUsername": "someoneSuperb@example.com",
      "entryPassword": "12341234",
      "passwordStatus": "compromised",
      "isPasswordStrong": false,
      "isPasswordCurrentlyBeingEdited": false,
    },
    {
      "id": 1,
      "websiteNickname": "Google",
      "entryUsername": "priyanshu@gmail.com",
      "entryPassword": "password",
      "passwordStatus": "reused",
      "isPasswordStrong": false,
      "isPasswordCurrentlyBeingEdited": false,
    },
    {
      "id": 2,
      "websiteNickname": "Steam",
      "entryUsername": "howdy",
      "entryPassword": "178t2sdkbjhaf732",
      "passwordStatus": "healthy",
      "isPasswordStrong": true,
      "isPasswordCurrentlyBeingEdited": false,
    },
  ];

  void addUserData({
    required int id,
    required String websiteNickName,
    required String entryUsername,
    required String entryPassword,
    required String passwordStatus,
    bool isPasswordStrong = false,
    bool isPasswordCurrentlyBeingEdited = false,
  }) {
    passwordEntries.add({
      "id": id,
      "websiteNickName": websiteNickName,
      "entryUsername": entryUsername,
      "entryPassword": entryPassword,
      "passwordStatus": passwordStatus,
      "isPasswordStrong": isPasswordStrong,
      "isPasswordCurrentlyBeingEdited": isPasswordCurrentlyBeingEdited,
    });
    notifyListeners();
  }

  void deleteUserData(int index) {
    passwordEntries.removeAt(index);
    notifyListeners();
  }

  void changeUserData({
    required int index,
    required int id,
    required String websiteNickName,
    required String entryUsername,
    required String entryPassword,
    required String passwordStatus,
    bool isPasswordStrong = false,
    bool isPasswordCurrentlyBeingEdited = false,
  }) {
    passwordEntries[index] = {
      "id": id,
      "websiteNickName": websiteNickName,
      "entryUsername": entryUsername,
      "entryPassword": entryPassword,
      "passwordStatus": passwordStatus,
      "isPasswordStrong": isPasswordStrong,
      "isPasswordCurrentlyBeingEdited": isPasswordCurrentlyBeingEdited,
    };
    notifyListeners();
  }
}

// 
// 
// 
// 
// 
// 