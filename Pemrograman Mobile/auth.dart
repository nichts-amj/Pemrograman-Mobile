import 'package:belajar_flutter/models/user.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  
  // Inisiasikan Data User
  late UserModel _user;

  // Buat Getter
  UserModel get user => _user;

  // Buat Function simulasi Login
  void simulateLogin(Map<String, dynamic> formData) {
    _user = UserModel(
      name: formData['name'], 
      email: formData['email'], 
      gender: formData['gender'], 
      isMarried: formData['isMarried'], 
      skills: formData['skills']
    );
    notifyListeners();
  }
  
}