import 'package:flutter/material.dart';
import 'package:suitmedia_mobiledev_2024/models/user_model.dart';
import 'package:suitmedia_mobiledev_2024/services/user_service.dart';

class PalindromeProvider extends ChangeNotifier {
  List<Datum> _usersList = [];
  final palindromeKey = GlobalKey<FormState>();
  String _input = '';
  String _output = '';
  String? _name;
  String? _username;

  String get input => _input;
  String get output => _output;
  String get name => _name ?? '';
  String get username => _username ?? 'Selected User Name';
  List<Datum> get usersList => _usersList;

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  set setUsername(String value) {
    _username = value;
    notifyListeners();
  }

  void setInput(String value) {
    _input = value;
    notifyListeners();
  }

  void setOutput(String value) {
    _output = value;
    notifyListeners();
  }

  void checkPalindrome() {
    if (_input == _input.split('').reversed.join()) {
      setOutput('Yes, it is a palindrome');
    } else {
      setOutput('No, it is not a palindrome');
    }
  }

  bool validateAndSave() {
    final form = palindromeKey.currentState;

    if (form != null && form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void getUsers() async {
    final usersPage1 = await UserService.getUsers("1");
    final usersPage2 = await UserService.getUsers("2");

    _usersList = [...usersPage1, ...usersPage2];
    notifyListeners();
  }
}
