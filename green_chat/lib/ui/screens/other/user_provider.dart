import 'package:flutter/material.dart';
import 'package:green_chat/core/models/user_model.dart';
import 'package:green_chat/core/services/database_service.dart';

class UserProvider extends ChangeNotifier {
  final DatabaseSerice _db;

  UserProvider(this._db);

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;
  loadUser(String uid) async {
    final Map<String, dynamic>? userData = await _db.loadUser(uid);

    if (userData != null) {
      _currentUser = UserModel.fromMap(userData);
      notifyListeners();
    }
  }
}
