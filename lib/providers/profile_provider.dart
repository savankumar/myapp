import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myapp/api/api_service.dart';
import 'package:myapp/models/user_model.dart';

class ProfileProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  User? _user;
  File? _profileImage;
  bool _isLoading = false;

  User? get user => _user;
  File? get profileImage => _profileImage;
  bool get isLoading => _isLoading;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void updateProfilePicture(File image) {
    _profileImage = image;
    notifyListeners();
  }

  Future<bool> changePassword(String currentPassword, String newPassword) async {
    _isLoading = true;
    notifyListeners();

    try {
      bool success = await _apiService.changePassword(user!.id, currentPassword, newPassword);
      _isLoading = false;
      notifyListeners();
      return success;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
